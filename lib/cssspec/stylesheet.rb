module Cssspec
  class Stylesheet
    attr_reader :path, :sections

    def initialize(attributes)
      @path = attributes[:path]
      @sections = attributes[:sections]
    end
  end
end
