require "active_support/core_ext/string/strip"
require "nokogiri"
require "redcarpet"

module Cssspec
  class Section
    class << self
      def render(content)
        renderer.render(content)
      end

      private

      def renderer
        @renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, fenced_code_blocks: true)
      end
    end

    def <<(line)
      lines << line
    end

    def code
      if node = tree.css("pre > code")[-1]
        node.text.strip
      end
    end

    def render
      @render ||= self.class.render(content)
    end

    private

    def tree
      Nokogiri.HTML(render)
    end

    def content
      lines.join("\n").strip_heredoc
    end

    def lines
      @lines ||= []
    end
  end
end
