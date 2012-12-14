require 'active_support/concern'

module SimplePages
  module Models
    module PageAttachment
      extend ActiveSupport::Concern
      included do
        has_many :attachments, as: :resource
      end

      module ClassMethods
      end
    end
  end
end
