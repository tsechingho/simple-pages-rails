require 'active_support/concern'

module SimplePages
  module Models
    module PageOwner
      extend ActiveSupport::Concern
      included do
        attr_reader :owner
        belongs_to :author, polymorphic: true
      end

      module ClassMethods
      end

      def owner=(attrs)
        owner_attrs = attrs.split(',')
        self.author_type = owner_attrs.first
        self.author_id = owner_attrs.last
      end
    end
  end
end
