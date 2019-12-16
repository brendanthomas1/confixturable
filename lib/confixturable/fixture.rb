# frozen_string_literal: true

require 'erb'

require 'confixturable/options'

module Confixturable
  class Fixture < ERB
    def initialize(filename, format, options)
      @format = format
      @file = read(filename)
      @options = Options.new(options, format)
    end

    def result
      ERB.new(file).result(binding)
    end

    private

    attr_reader :file, :format, :options

    def file_path(filename)
      "#{Confixturable.configuration.fixture_path}/#{filename}.#{format}.erb"
    end

    def read(filename)
      path = file_path(filename)
      File.open(path).read
    rescue Errno::ENOENT
      raise MissingFileError, "The file \"#{path}\" could not be found"
    end
  end
end
