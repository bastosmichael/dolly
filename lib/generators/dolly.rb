require 'rails/generators/named_base'
require 'rails/generators/migration'
require 'rails/generators/active_model'

module Dolly
  module Generators

    class Base < ::Rails::Generators::NamedBase #:nodoc:

      include ::Rails::Generators::Migration

      def self.source_root
        @_dolly_source_root ||=
        File.expand_path("../#{base_name}/#{generator_name}/templates", __FILE__)
      end

      protected

      # Dolly does not care if migrations have the same name as long as
      # they have different ids.
      #
      def migration_exists?(dirname, file_name) #:nodoc:
        false
      end

      # Implement the required interface for Rails::Generators::Migration.
      #
      def self.next_migration_number(dirname) #:nodoc:
        "%.3d" % (current_migration_number(dirname) + 1)
      end

    end
  end
end