require 'rails/generators/migration'

module Ecm
  module Ads
    module Generators
      class MigrationsGenerator < ::Rails::Generators::Base
        include Rails::Generators::Migration
        source_root File.expand_path('../templates', __FILE__)
        desc "add the migrations"

        def self.next_migration_number(path)
          unless @prev_migration_nr
            @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
          else
            @prev_migration_nr += 1
          end
          @prev_migration_nr.to_s
        end

        def copy_ads_migration
          migration_template "create_ads.rb", "db/migrate/create_ads.rb"
        end
        
        def copy_ad_positions_migration
          migration_template "create_ad_positions.rb", "db/migrate/create_ad_positions.rb"        
        end
        
        def copy_ad_formats_migration
          migration_template "create_ad_formats.rb", "db/migrate/create_ad_formats.rb"
        end                
      end
    end
  end
end

