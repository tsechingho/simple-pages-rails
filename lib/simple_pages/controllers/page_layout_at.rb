require 'active_support/concern'

module SimplePages
  module Controllers
    module PageLayoutAt
      extend ActiveSupport::Concern
      included do
        cattr_accessor :page_layout_at
        self.page_layout_at = %w{general header footer}

        helper_method :pages_layout_at
        helper_method :page_layout_at
      end

      module ClassMethods
        def has_page_layout_at=(layouts = [])
          self.page_layout_at += layouts unless layouts.blank?
        end
        alias :has_page_layout_at :has_page_layout_at=
      end

      protected

      def pages_layout_at(location)
        SimplePages::Page.without_cluster.layout_at(location).published
      end
    end
  end
end
