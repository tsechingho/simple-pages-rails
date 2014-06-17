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
    end
  end
end
