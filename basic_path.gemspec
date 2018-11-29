# coding: utf-8
Gem::Specification.new do |s|
  s.name = 'basic_path'
  s.version = '0.0.1'
  s.date = '2018-11-29'
  s.authors = ["Jesse Curry"]
  s.email = ['jesse@jessecurry.net']
  s.summary = "Regex constrained Basic Auth"
  s.homepage = 'https://github.com/HandRolled/rack-basic_path'
  s.license = 'MIT'

  s.files = [
    "lib/basic_path.rb"
  ]
  s.require_paths = ["lib"]

  # Dependencies
  s.add_development_dependency "bundler", "~> 1.3"

  s.add_runtime_dependency "rack", "~> 2.0"
end
