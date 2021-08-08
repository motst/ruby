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
    # rubocop: disable Metrics/AbcSize
    # rubocop: disable Metrics/PerceivedComplexity
    def validate!
      attrs = {}
      attrs = { name: @name } if instance_of?(Station)
      attrs = { number: @number, type: @type } if instance_of?(Train)
      attrs = { start: @stations[0], finish: @stations[-1] } if instance_of?(Route)
      attrs.each do |attr, value|
        choosed_attrs = self.class.validations.select { |attr_val| attr_val[0] == attr }
        choosed_attrs.each do |option|
          raise "#{value} can't be empty!" if option[1] == :presence && value.nil?
          raise "#{value} has invalid format!" if option[1] == :format && value !~ option[2]
          raise "Type doesn't match the specified class!" if option[1] == :type && value.class != option[2]
        end
      end
    end
    # rubocop: enable Metrics/AbcSize
    # rubocop: enable Metrics/PerceivedComplexity

    def valid?
      validate!
      true
    rescue StandardError
      false
    end
  end
end
