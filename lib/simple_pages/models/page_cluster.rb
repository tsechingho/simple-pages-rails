require 'active_support/concern'

module SimplePages
  module Models
    module PageCluster
      extend ActiveSupport::Concern
      included do
        serialize :cluster
        attr_accessible :cluster
      end

      module ClassMethods
        def without_cluster
          where(cluster: "--- \n...\n")
        end

        def with_cluster(name)
          where('cluster LIKE ?', "%#{name}%")
        end
      end

      def cluster=(values)
        values = values.delete_if { |v| v.blank? }
        if values.blank?
          super nil
        else
          super values
        end
      end
    end
  end
end
