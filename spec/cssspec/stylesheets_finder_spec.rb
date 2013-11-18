require "spec_helper"

module Cssspec
  describe StylesheetsFinder do
    describe ".find" do
      it "returns an array of Stylesheet from a glob pattern String" do
        stylesheets = described_class.find("spec/fixtures/*.css")
        stylesheets.size.should == 2
        stylesheets[0].should be_a Cssspec::Stylesheet
        stylesheets[0].path.should == Pathname.new("spec/fixtures/bootstrap.css")
        stylesheets[0].sections.should be_a Array
        stylesheets[1].should be_a Cssspec::Stylesheet
        stylesheets[1].path.should == Pathname.new("spec/fixtures/example.css")
        stylesheets[1].sections.should be_a Array
      end
    end
  end
end
