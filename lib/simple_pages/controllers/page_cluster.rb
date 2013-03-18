require 'active_support/concern'

module SimplePages
  module Controllers
    module PageCluster
      extend ActiveSupport::Concern
      included do
        helper_method :pages_cluster_for
      end

      module ClassMethods
      end

      protected

      def pages_cluster_for(name, location)
        SimplePages::Page.with_cluster(name).layout_at(location).published
      end

      def load_page_cluster_options
        @cluster_options = ::Role.all.map do |role|
          [t(role.name, scope: 'roles.names'), role.name]
        end
      end
    end
  end
end
