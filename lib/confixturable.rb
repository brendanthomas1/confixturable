# frozen_string_literal: true

require 'confixturable/fixture'
require 'confixturable/version'

module Confixturable
  class MissingFileError < StandardError; end

  class << self
    def create(file, format: :json, options: {})
      Fixture.new(file, format, options).result
    end
  end
end
