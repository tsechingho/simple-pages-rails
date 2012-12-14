require 'active_support/concern'

module SimplePages
  module Models
    module PageLocale
      extend ActiveSupport::Concern
      included do
      end

      module ClassMethods
        def localized(locale = ::I18n.locale)
          if locale.to_s == 'en'
            scoped
          else
            where('url LIKE ?', "%-#{locale.to_s.downcase}")
          end
        end
      end

      def set_as_localized(locale = ::I18n.locale)
        return if locale.to_s == 'en'
        unless url =~ /#{locale.to_s.downcase}$/
          self.url += "-#{locale.to_s}"
        end
      end
    end
  end
end
