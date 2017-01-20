require 'sprockets/railtie'
require 'browserify-rails'

module Memleak
  class Engine < ::Rails::Engine
    isolate_namespace Memleak

    config.browserify_rails.paths << -> (p) { p.start_with?(Engine.root.join("app").to_s) }
    config.browserify_rails.node_bin = '../../node_modules/.bin'
    config.browserify_rails.commandline_options = "-t [ babelify --presets [ es2015 react stage-0 ] ]"
  end
end
