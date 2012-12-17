require 'devise_ext'
require 'cancan_ext'

SimplePages.configure do |config|
  # mixin controller modules.
  config.controller_modules += [DeviseExt, CanCanExt]

  # mixin helper modules.
  # config.helper_modules += []

  # set table name of Page, default to simple_pages.
  # config.page_table_name = 'simple_pages'

  # mixin modules for Page.
  # config.page_modules += []

  # set per page of pagination for page controller, default to 30.
  # config.pages_per_page = 30
end
