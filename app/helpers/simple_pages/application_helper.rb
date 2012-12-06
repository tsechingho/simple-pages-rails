module SimplePages
  module ApplicationHelper
    SimplePages.helper_modules.each do |module_name|
      include module_name
    end
  end
end
