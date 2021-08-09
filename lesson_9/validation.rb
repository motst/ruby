# frozen_string_literal: true

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :validations

    def validate(*attrs)
      @validations ||= []
      @validations << attrs
    end
  end

  module InstanceMethods
    def presence_validation(value, _choosed_attr)
      raise "#{value} can't be empty" if value.nil?
    end

    def format_validation(value, choosed_attr)
      raise "#{value} has invalid format" if value !~ choosed_attr[2]
    end

    def type_validation(value, choosed_attr)
      raise "Type doesn't match the specified class" if value.class != choosed_attr[2]
    end

    # rubocop: disable Metrics/AbcSize
    def validate!
      attrs = {}
      attrs = { name: @name } if instance_of?(Station)
      attrs = { number: @number, type: @type } if instance_of?(Train)
      attrs = { start: @stations[0], finish: @stations[-1] } if instance_of?(Route)
      attrs.each do |attr, value|
        choosed_attrs = self.class.validations.select { |attr_val| attr_val[0] == attr }
        choosed_attrs.each do |choosed_attr|
          send("#{choosed_attr[1]}_validation", value, choosed_attr)
        end
      end
    end
    # rubocop: enable Metrics/AbcSize

    def valid?
      validate!
      true
    rescue StandardError
      false
    end
  end
end
