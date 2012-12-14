require 'rails-theme-helper'

require 'simple_pages/engine'
require 'simple_pages/page_author'
require 'simple_pages/page_layout_at'

module SimplePages
  mattr_accessor :controller_modules
  @@controller_modules = []

  mattr_accessor :helper_modules
  @@helper_modules = []

  mattr_accessor :page_table_name
  @@page_table_name = 'simple_pages'

  mattr_accessor :page_modules
  @@page_modules = []

  mattr_accessor :pages_per_page
  @@pages_per_page = 30

  def self.configure
    yield self
  end
end
