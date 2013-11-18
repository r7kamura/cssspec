require "spec_helper"
require "active_support/core_ext/string/strip"

module Cssspec
  describe Parser do
    let(:path) do
      double(each_line: content.each_line)
    end

    describe "#parse" do
      context "with comments" do
        let(:content) do
          <<-EOF
            // Button
            //
            // ```
            // <button class="button">button</button>
            // ```
            .button {
              ...
            }

            /*
              Border

              ```
              <div class="border"></div>
              ```
            */
            .border {
              ...
            }
          EOF
        end

        it "returns an array of Section from a Pathname" do
          sections = described_class.parse(path)
          sections.size.should == 2
          sections[0].should be_a Section
          sections[0].code.should == '<button class="button">button</button>'
          sections[0].render.should == <<-"EOF".strip_heredoc
          <p>Button</p>

          <pre><code>#{CGI.escapeHTML('<button class="button">button</button>')}
          </code></pre>
          EOF
          sections[1].should be_a Section
          sections[1].code.should == '<div class="border"></div>'
          sections[1].render.should == <<-"EOF".strip_heredoc
          <p>Border</p>

          <pre><code>#{CGI.escapeHTML('<div class="border"></div>')}
          </code></pre>
          EOF
        end
      end
    end
  end
end
