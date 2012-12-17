require 'active_support/concern'

module CanCanExt
  extend ActiveSupport::Concern
  included do
    rescue_from ::CanCan::AccessDenied do |exception|
      redirect_to secure_root_url, alert: exception.message
    end

    helper_method :secure_root_url
  end

  module ClassMethods
  end

  protected

  def current_ability
    @current_ability ||= Ability.new session_user
  end

  def secure_root_url
    main_app.root_url
  end
end
