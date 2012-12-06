require 'rails-theme-helper/app_helpers'

require 'simple_pages/engine'
require 'simple_pages/page_author'
require 'simple_pages/page_layout_at'

module SimplePages
  mattr_accessor :application_controller_modules
  @@application_controller_modules = []

  mattr_accessor :helper_modules
  @@helper_modules = [
    RailsTheme::LayoutHelper,
    RailsTheme::BootstrapHelper
  ]

  mattr_accessor :page_table_name
  @@page_table_name = 'simple_pages'

  mattr_accessor :page_modules
  @@page_modules = []
end
