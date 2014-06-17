module SimplePages
  class ApplicationController < ActionController::Base
    respond_to :html

    helper ::RailsTheme::Engine.helpers
    helper SimplePages.helper_modules

    SimplePages.controller_modules.each { |module_name| include module_name }

    if SimplePages.extra_page_layout.present?
      has_page_layout_at SimplePages.extra_page_layout
    end
  end
end
