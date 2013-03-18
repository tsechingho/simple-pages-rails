require 'simple_pages/engine'
require 'simple_pages/controllers/page_cluster'
require 'simple_pages/controllers/page_layout_at'
require 'simple_pages/models/page_attachment'
require 'simple_pages/models/page_author'
require 'simple_pages/models/page_cluster'
require 'simple_pages/models/page_locale'
require 'simple_pages/models/page_owner'
require 'simple_pages/models/page_url'

module SimplePages
  mattr_accessor :controller_modules
  @@controller_modules = [
    SimplePages::Controllers::PageCluster,
    SimplePages::Controllers::PageLayoutAt
  ]

  mattr_accessor :extra_page_layout
  @@extra_page_layout = []

  mattr_accessor :helper_modules
  @@helper_modules = []

  mattr_accessor :page_table_name
  @@page_table_name = 'simple_pages'

  mattr_accessor :page_modules
  @@page_modules = [
    SimplePages::Models::PageUrl,
    SimplePages::Models::PageOwner,
    SimplePages::Models::PageLocale,
    SimplePages::Models::PageCluster,
    SimplePages::Models::PageAttachment
  ]

  mattr_accessor :pages_per_page
  @@pages_per_page = 30

  def self.configure
    yield self
  end
end
