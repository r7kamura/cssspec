# Converts SCSS path to an array of Sections.
#
# Example:
#
#   sections = Cssspec::Parser.parse("stylesheets/main.scss")
#   sections[0].code #=> '<button class="button">button</button>'
#   sections[0].render #=> "<p>Button</p>\n\n<pre> ... </pre>"
#
module Cssspec
  class Parser
    def self.parse(*args)
      new(*args).parse
    end

    def initialize(path)
      @path = path
      @sections = []
    end

    def parse
      lines.each do |line|
        on_begin_multi_comment  if line.begin_multi_comment?
        on_begin_single_comment if !@in_comment && !@current_section && line.comment?
        on_add_line(line)       if @in_comment || line.comment?
        on_end_single_comment   if !@in_comment && @current_section && !line.comment?
        on_end_multi_comment    if line.end_multi_comment?
      end
      @sections
    end

    private

    def lines
      @path.each_line.map {|line| Line.new(line) }
    end

    def on_begin_multi_comment
      on_begin_single_comment
      @in_comment = true
    end

    def on_begin_single_comment
      @current_section = Section.new
    end

    def on_add_line(line)
      @current_section << line.stripped_content
    end

    def on_end_single_comment
      @sections << @current_section
      @current_section = nil
    end

    def on_end_multi_comment
      on_end_single_comment
      @in_comment = nil
    end
  end
end
