# frozen_string_literal: true

require 'json'

module Confixturable
  class Options
    def initialize(options, format)
      @options = options
      @format = format
    end

    # should this default to nil or raise if not found
    def fetch(name, default = nil)
      value = options.fetch(name, default)

      return_formatted_value(value)
    end

    private

    attr_reader :options, :format

    def return_formatted_value(value)
      format == :json ? value.to_json : json
    end
  end
end
