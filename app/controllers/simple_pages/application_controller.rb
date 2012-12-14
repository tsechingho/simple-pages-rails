module SimplePages
  class ApplicationController < ActionController::Base
    include SimplePages::PageLayoutAt

    respond_to :html

    helper ::RailsTheme::Engine.helpers
    helper SimplePages.helper_modules

    SimplePages.controller_modules.each do |module_name|
      include module_name
    end
  end
end
