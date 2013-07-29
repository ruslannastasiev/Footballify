$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "footballify/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "footballify"
  s.version     = Footballify::VERSION
  s.authors     = ["ruslannastasiev"]
  s.email       = ["ruslan0607@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of Footballify."
  s.description = "Description of Footballify."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.14"
  # s.add_dependency "jquery-rails"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency 'capybara'
  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "shoulda-matchers"

end
