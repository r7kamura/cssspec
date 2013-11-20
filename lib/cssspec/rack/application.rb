require "padrino"
require "slim"

# A default rack application to serve CSS styleguide.
module Cssspec
  class Application < Padrino::Application
    register Padrino::Helpers
    register Padrino::Rendering

    set :scss, views: "#{root}/stylesheets", load_paths: ["#{root}/stylesheets"]
    set :show_exceptions, false
    set :pattern, "{,**/}*.{css,scss}"

    disable :logging
    enable :reloader

    error do |exception|
      raise exception
    end

    get "/stylesheets/all.css" do
      content_type "text/css"
      scss :all
    end

    get "/index.html" do
      @stylesheets = stylesheets
      slim :index
    end

    get "/styleguide/*segments.html" do
      @stylesheet = Cssspec::StylesheetsFinder.find(params[:segments].join(?/))[0]
      slim :show
    end

    helpers do
      def stylesheets
        Cssspec::StylesheetsFinder.find(settings.pattern)
      end
    end
  end
end
