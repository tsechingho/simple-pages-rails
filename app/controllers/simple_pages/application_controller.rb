module SimplePages
  class ApplicationController < ActionController::Base
    include SimplePages::PageLayoutAt

    respond_to :html

    SimplePages.application_controller_modules.each do |module_name|
      include module_name
    end
  end
end
