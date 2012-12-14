# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple-pages-rails/version'

Gem::Specification.new do |gem|
  gem.name          = 'simple-pages-rails'
  gem.version       = SimplePagesRails::VERSION
  gem.authors       = ['Tse-Ching Ho']
  gem.email         = ['tsechingho@gmail.com']
  gem.description   = %q{This gem provides simple pages with rails engine}
  gem.summary       = %q{provides simple pages with rails engine}
  gem.homepage      = 'https://github.com/tsechingho/simple-pages-rails'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'rails', '~> 3.2.9'
  gem.add_dependency 'rails-theme-helper'

  gem.add_development_dependency 'mysql2'
end
