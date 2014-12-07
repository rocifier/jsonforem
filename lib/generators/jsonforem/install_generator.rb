require 'securerandom'

module Jsonforem
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../", __FILE__)

      desc "Sets up routes and migrations."
      class_option :orm

      def install_assets
        require 'rails'
      end

      def setup_routes
        route "mount Jsonforem::Engine => '/forum'"
      end

      def self.source_root
        File.expand_path("../../../../", __FILE__)
      end

      def create_migrations
        #rake("jsonforem:install:migrations")
        Dir["#{self.class.source_root}/db/migrate/*.rb"].sort.each do |filepath|
          name = File.basename(filepath)
          template filepath, "db/migrate/#{name}"
          sleep 1
        end
      end
    end
  end
end
