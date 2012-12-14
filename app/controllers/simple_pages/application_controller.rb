module SimplePages
  class ApplicationController < ActionController::Base
    respond_to :html

    helper ::RailsTheme::Engine.helpers
    helper SimplePages.helper_modules

    SimplePages.controller_modules.each do |module_class|
      include module_class
    end
  end
end
