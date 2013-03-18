require 'active_support/concern'

module SimplePages
  module Controllers
    module PageLayoutAt
      extend ActiveSupport::Concern
      included do
        cattr_accessor :page_layout_at
        self.page_layout_at = %w{general header footer}

        helper_method :pages_layout_at
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

      def load_page_layout_at_options
        @layout_at_options = page_layout_at.map do |key|
          [t(key, scope: 'simple_pages.layout_at'), key]
        end
      end
    end
  end
end
