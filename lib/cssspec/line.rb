# Represents a line of SCSS file to help parser work well.
module Cssspec
  class Line
    SINGLE_COMMENT_REGEXP = %r<^\s*(//)>
    BEGIN_MULTI_COMMENT_REGEXP = %r<^\s*(/\*)>
    END_MULTI_COMMENT_REGEXP = %r<\*/\s*$>
    COMMENT_REGEXP = Regexp.union([
      BEGIN_MULTI_COMMENT_REGEXP,
      END_MULTI_COMMENT_REGEXP,
      SINGLE_COMMENT_REGEXP,
    ])

    def initialize(content)
      @content = content
    end

    def single_comment?
      SINGLE_COMMENT_REGEXP === @content
    end

    def begin_multi_comment?
      BEGIN_MULTI_COMMENT_REGEXP === @content
    end

    def end_multi_comment?
      END_MULTI_COMMENT_REGEXP === @content
    end

    def comment?
      COMMENT_REGEXP === @content
    end

    def stripped_content
      @content.gsub(COMMENT_REGEXP, "").rstrip
    end
  end
end
