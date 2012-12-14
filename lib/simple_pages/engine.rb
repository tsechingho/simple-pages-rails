module SimplePages
  class Engine < ::Rails::Engine
    isolate_namespace SimplePages
  end
end

require 'jquery-rails'
require 'will_paginate'
require 'rails-theme-helper'
require 'chosen-rails'
require 'ckeditor_rails'
require 'stringex'
