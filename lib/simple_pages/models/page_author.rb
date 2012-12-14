require 'active_support/concern'

module SimplePages
  module Models
    module PageAuthor
      extend ActiveSupport::Concern
      included do
        has_many :simple_pages, class_name: 'SimplePages::Page', as: :author
      end

      module ClassMethods
      end

      def simple_page_owner_option
        "#{self.class.name},#{self.id}"
      end
    end
  end
end
