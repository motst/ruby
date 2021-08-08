# frozen_string_literal: true

module Accessors
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :var_history

    def attr_accessor_with_history(*attrs)
      @var_history ||= attrs.zip([]).to_h
      attrs.each do |attr|
        var_name = "@#{attr}".to_sym
        @var_history[attr] ||= [0]
        define_method(attr) { instance_variable_get(var_name) }
        define_method("#{attr}=".to_sym) do |value|
          self.class.var_history[attr] << value
          instance_variable_set(var_name, value)
        end
      end
    end

    def strong_attr_accessor(*attrs)
      [attrs].to_h.each do |attr, type|
        var_name = "@#{attr}".to_sym
        define_method(attr) { instance_variable_get(var_name) }
        raise 'Invalid class' if attr.class != type

        define_method("#{attr}=".to_sym) { |value| instance_variable_set(var_name, value) }
      end
    end
  end

  module InstanceMethods
    def method_missing(method_name)
      if method_name.to_s[-8..-1] == '_history'
        choosed_name = method_name.to_s.chomp('_history').to_sym
        self.class.var_history.select { |name, _values| name == choosed_name }
      else
        super
      end
    end

    def respond_to_missing?(method_name)
      method_name.to_s[-8..-1] == '_history' || super
    end
  end
end
