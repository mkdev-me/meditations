require 'yaml'
require 'ostruct'

module Meditations
  class Chapter

    attr_reader :data

    def self.load_all(locale)
      Dir[File.join(File.dirname(__FILE__), "../../chapters/#{locale}/*.yaml")].map do |c|
        new(YAML.load_file(c))
      end.sort_by(&:position)
    end

    def self.find(locale, position)
      load_all(locale).select { |c| c.position == position.to_i }.first
    end

    def initialize(contents)
      @data = OpenStruct.new(contents)
    end

    def opinions
      Array(@data.opinions)
    end

    def resources
      Array(@data.resources)
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
