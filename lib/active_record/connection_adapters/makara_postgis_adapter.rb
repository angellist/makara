require 'active_record/connection_adapters/makara_abstract_adapter'
require 'active_record/connection_adapters/postgis_adapter'

module ActiveRecord
  module ConnectionAdapters
    class MakaraPostgisAdapter < ActiveRecord::ConnectionAdapters::MakaraAbstractAdapter
      def self.visitor_for(*args)
        ActiveRecord::ConnectionAdapters::PostGISAdapter.visitor_for(*args)
      end

      protected

      def active_record_connection_for(config)
        ActiveRecord::ConnectionAdapters::PostGISAdapter.new(config)
      end
    end
  end
end

ActiveRecord::ConnectionAdapters.register("makara_postgis", "ActiveRecord::ConnectionAdapters::PostgreSQLMakaraAdapter", "active_record/connection_adapters/makara_postgis_adapter")
