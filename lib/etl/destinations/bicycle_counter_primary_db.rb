require 'csv'

module Etl
  module Destinations
    class BicycleCounterPrimaryDb
      def write(row)
        ::DepartmentOfTransportation::BicycleCounter.create!(
          original_id: row[:id],
          name: row[:name],
          domain: row[:domain],
          latitude: row[:latitude],
          longitude: row[:longitude],
          interval: row[:interval],
          timezone: row[:timezone],
          sens: row[:sens],
          counter: row[:counter]
        )
      end
    end
  end
end