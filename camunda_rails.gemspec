$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "camunda_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "camunda_rails"
  spec.version     = CamundaRails::VERSION
  spec.authors     = ["Arthur Tofani"]
  spec.email       = ["gramofone@gmail.com"]
  spec.homepage    = "https://github.com/arthurtofani/camunda-rails"
  spec.summary     = "Easy integration between Rails applications and Camunda Workflow Engine"
  spec.description = "This gem promotes the ability to use Camunda to manage complex workflows along with a Rails application "
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.2.3"
  spec.add_dependency "rspec-rails", "~> 3.0"

  spec.add_development_dependency "sqlite3"
end
