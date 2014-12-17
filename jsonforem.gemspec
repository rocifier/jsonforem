$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "jsonforem/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "miniature-octo-dribble"
  s.version     = Jsonforem::VERSION
  s.authors     = ["Ryan O'Connor"]
  s.email       = ["rocifier@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "JSON REST forum backend api."
  s.description = "JSON REST forum backend api."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.7"
  s.add_dependency "textacular", "~> 3.0"
  s.add_dependency "jbuilder"
  s.add_development_dependency "sqlite3"

end
