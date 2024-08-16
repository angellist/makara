require 'active_record/connection_adapters/makara_abstract_adapter'
require 'active_record/connection_adapters/postgresql_adapter'

module ActiveRecord
  module ConnectionAdapters
    class PostgreSQLMakaraAdapter < ActiveRecord::ConnectionAdapters::MakaraAbstractAdapter
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

ActiveRecord::ConnectionAdapters.register("postgresql_makara", "ActiveRecord::ConnectionAdapters::PostgreSQLMakaraAdapter", "active_record/connection_adapters/postgresql_makara_adapter")
