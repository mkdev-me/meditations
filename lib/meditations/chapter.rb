require 'yaml'
require 'ostruct'

module Meditations
  class Chapter

    attr_reader :data

    def self.load_all
      Dir[File.join(File.dirname(__FILE__), "../../chapters/*.yaml")].map do |c|
        new(YAML.load_file(c))
      end.sort_by(&:position)
    end

    def initialize(contents)
      @data = OpenStruct.new(contents)
    end

    def method_missing(method_sym, *arguments, &block)
      if @data.respond_to?(method_sym)
        @data.send(method_sym)
      else
        super
      end
    end

  end
end
