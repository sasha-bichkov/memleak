$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "memleak/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "memleak"
  s.version     = Memleak::VERSION
  s.authors     = ["Sasha Bichkov"]
  s.email       = ["aleksandar.bichkov@gmail.com"]
  s.homepage    = "https://github.com/sasha-bichkov/memleak"
  s.summary     = "The rails engine for profiling memory leaks."
  s.description = "The rails engine for profiling memory leaks."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.2", "< 5.1"
  s.add_dependency "sass-rails"

  s.add_development_dependency "sqlite3"
end
