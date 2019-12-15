# frozen_string_literal: true

require 'erb'

require 'confixturable/options'

module Confixturable
  class Fixture < ERB
    def initialize(file, format, options)
      @options = Options.new(options, format)
      @file = read(file, format)
    end

    def result
      ERB.new(file).result(binding)
    end

    private

    attr_reader :file, :options

    def read(file, format)
      path = "spec/fixtures/#{file}.#{format}.erb"
      File.open(path).read
    rescue Errno::ENOENT
      raise MissingFileError, "The file \"#{path}\" could not be found"
    end
  end
end
