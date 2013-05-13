require 'active_support/concern'

module SimplePages
  module Models
    module PageUrl
      extend ActiveSupport::Concern
      included do
        attr_accessible :url
        validates :url, format: { with: /\A([\w\-]{3,})\z/ }, allow_blank: true
        acts_as_url :title, sync_url: true, only_when_blank: true
      end

      module ClassMethods
        def find_or_create_by_url(attrs)
          url = attrs.delete :url
          where(url: url).first_or_create(attrs)
        end
      end

      def to_param
        url
      end
    end
  end
end
