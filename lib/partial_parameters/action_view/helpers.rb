require 'partial_parameters/version'
require 'partial_parameters/errors'

module PartialParameters
  module ActionView
    module Helpers
      if ENV['RAILS_ENV'] == 'production'
        def partial_parameters(**args); end
      else
        def partial_parameters(strict: true, &block)
          raise NoBlockGivenError if block.nil?
          raise InvalidContextError unless block.binding.local_variable_defined?(:local_assigns)

          @__local_assigns = block.binding.local_variable_get(:local_assigns)
          @__defined_parameters = []
          yield
          unknown_params = @__local_assigns.keys - @__defined_parameters
          raise UnknownParametersError, unknown_params if strict && unknown_params.any?
        ensure
          @__defined_parameters = []
        end
      end

      private

      def required(name)
        optional(name)
        return if @__local_assigns.key?(name)
        raise MissingParameterError, name
      end

      def optional(name)
        @__defined_parameters << name
      end
    end
  end
end
