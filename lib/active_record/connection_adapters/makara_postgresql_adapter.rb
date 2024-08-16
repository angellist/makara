require 'active_record/connection_adapters/makara_abstract_adapter'
require 'active_record/connection_adapters/postgresql_adapter'

module ActiveRecord
  module ConnectionAdapters
    class MakaraPostgreSQLAdapter < ActiveRecord::ConnectionAdapters::MakaraAbstractAdapter
      include PostgreSQL::Quoting

      class << self
        def visitor_for(*args)
          ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.visitor_for(*args)
        end
      end

      protected

      def active_record_connection_for(config)
        ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.new(config)
      end
    end
  end
end

ActiveRecord::ConnectionAdapters.register("makara_postgresql", "ActiveRecord::ConnectionAdapters::MakaraPostgreSQLAdapter", "active_record/connection_adapters/makara_postgresql_adapter")
