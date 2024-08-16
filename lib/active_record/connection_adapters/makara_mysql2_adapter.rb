require 'active_record/connection_adapters/makara_abstract_adapter'
require 'active_record/connection_adapters/mysql2_adapter'

module ActiveRecord
  module ConnectionAdapters
    class MakaraMysql2Adapter < ActiveRecord::ConnectionAdapters::MakaraAbstractAdapter
      include MySQL::Quoting

      class << self
        def visitor_for(*args)
          ActiveRecord::ConnectionAdapters::Mysql2Adapter.visitor_for(*args)
        end
      end

      protected

      def active_record_connection_for(config)
        ActiveRecord::ConnectionAdapters::Mysql2Adapter.new(config)
      end
    end
  end
end

ActiveRecord::ConnectionAdapters.register("makara_mysql2", "ActiveRecord::ConnectionAdapters::MakaraPostgreSQLAdapter", "active_record/connection_adapters/makara_mysql2_adapter")
