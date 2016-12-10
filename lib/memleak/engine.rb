require 'sprockets/railtie'
require 'browserify-rails'

module Memleak
  class Engine < ::Rails::Engine
    isolate_namespace Memleak

    config.browserify_rails.paths << -> (p) { p.start_with?(Engine.root.join("app").to_s) }
    config.browserify_rails.node_bin = '../../node_modules/.bin'
  end
end
