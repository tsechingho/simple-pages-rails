class ApplicationController < ActionController::Base
  include DeviseExt
  include CanCanExt
  include SimplePages::Controllers::PageLayoutAt
  protect_from_forgery
end
