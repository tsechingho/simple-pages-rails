module SimplePages
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc 'Copies SimplePages configuration file and libraries.'
      source_root File.expand_path('../templates', __FILE__)
      class_option :user_model, default: 'user', desc: 'User model used in application.'

      def copy_libraries
        template 'devise_ext.rb', 'lib/devise_ext.rb'
        template 'cancan_ext.rb', 'lib/cancan_ext.rb'
      end

      def copy_config_file
        template 'simple_pages.rb', 'config/initializers/simple_pages.rb'
      end

      def append_user_mixin
        user_model = "app/models/#{options[:user_model].downcase}.rb"
        unless File.exist? user_model
          raise 'You need to specify an user model. Try --user-model option'
        end
        insert_into_file user_model, before: /^end\n/ do
          <<-CODE
  def name
    email
  end

  include SimplePages::Models::PageAuthor
          CODE
        end
      end

      def mount_routes
        insert_into_file 'config/routes.rb', after: "routes.draw do\n" do
          "  mount SimplePages::Engine, at: '/'\n"
        end
      end
    end
  end
end
