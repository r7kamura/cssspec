$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "cssspec"

Cssspec::Application.set :pattern, "spec/fixtures/*.css"
run Cssspec::Application
