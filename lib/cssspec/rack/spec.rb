require "cssspec"
require "sitespec"

Sitespec.configuration.application = Cssspec::Application.new

describe "Cssspec" do
  include Sitespec

  it "generates css styleguide" do
    get "/index.html"
  end
end
