module SimplePages
  class Engine < ::Rails::Engine
    isolate_namespace SimplePages

    config.generators.stylesheet_engine :sass
    config.generators.integration_tool :rspec
    config.generators.test_framework :rspec
    config.generators.fixture_replacement :factory_girl, dir: 'spec/factories'
  end
end

require 'jquery-rails'
require 'will_paginate'
require 'rails-theme-helper'
require 'chosen-rails'
require 'ckeditor_rails'
require 'stringex'
