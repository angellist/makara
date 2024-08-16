# frozen_string_literal: true

require 'active_record/connection_adapters/makara_abstract_adapter'
require 'active_record/connection_adapters/trilogy_adapter'

module ActiveRecord
  module ConnectionAdapters
    class MakaraTrilogyAdapter < ActiveRecord::ConnectionAdapters::MakaraAbstractAdapter
      include MySQL::Quoting

      class << self
        def visitor_for(*args)
          ActiveRecord::ConnectionAdapters::TrilogyAdapter.visitor_for(*args)
        end
      end

      protected

      def active_record_connection_for(config)
        ActiveRecord::ConnectionAdapters::TrilogyAdapter.new(config)
      end
    end
  end
end

ActiveRecord::ConnectionAdapters.register("makara_trilogy", "ActiveRecord::ConnectionAdapters::MakaraTrilogyAdapter", "active_record/connection_adapters/makara_trilogy_adapter")
