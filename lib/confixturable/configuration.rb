# frozen_string_literal: true

module Confixturable
  class Configuration
    attr_accessor :fixture_path

    def initialize
      @fixture_path = 'spec/fixtures'
    end
  end
end
