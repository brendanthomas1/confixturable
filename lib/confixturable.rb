# frozen_string_literal: true

require 'confixturable/configuration'
require 'confixturable/fixture'
require 'confixturable/version'

module Confixturable
  class MissingFileError < StandardError; end

  class << self
    attr_writer :configuration

    def create(file, format: :json, options: {})
      Fixture.new(file, format, options).result
    end

    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end
