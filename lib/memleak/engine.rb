module Memleak
  class Engine < ::Rails::Engine
    isolate_namespace Memleak
  end
end
