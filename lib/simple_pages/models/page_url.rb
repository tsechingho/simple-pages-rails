require 'active_support/concern'

module SimplePages
  module Models
    module PageUrl
      extend ActiveSupport::Concern
      included do
        attr_accessible :url
        validates :url, format: { with: /[\w\d\-_]{3,}/ }, allow_blank: true
        acts_as_url :title, sync_url: true, only_when_blank: true
      end

      module ClassMethods
        def find_or_create_by_url(attrs)
          url = attrs.delete :url
          page = where(url: url).first
          if page.nil?
            page = create(attrs)
            page.url = url
            page.save
          end
          page
        end
      end

      def to_param
        url
      end
    end
  end
end
