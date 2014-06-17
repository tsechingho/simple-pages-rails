require 'active_support/concern'

module DeviseExt
  extend ActiveSupport::Concern
  included do
    helper_method :session_user
  end

  module ClassMethods
  end

  protected

  def authenticate_session!
    authenticate_user!
  end

  def session_user
    current_user
  end
end
