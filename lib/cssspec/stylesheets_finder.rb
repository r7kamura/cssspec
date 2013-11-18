require "pathname"

module Cssspec
  class StylesheetsFinder
    def self.find(*args)
      new(*args).find
    end

    def initialize(pattern)
      @pattern = pattern
    end

    def find
      Pathname.glob(@pattern).sort.map do |path|
        Stylesheet.new(
          path: path,
          sections: Parser.parse(path),
        )
      end
    end
  end
end
