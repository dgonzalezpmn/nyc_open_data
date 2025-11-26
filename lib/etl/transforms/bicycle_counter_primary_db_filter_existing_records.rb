module Etl
  module Transforms
    class BicycleCounterPrimaryDbFilterExistingRecords
      def process(row)
        puts row

        if ::DepartmentOfTransportation::BicycleCounter.find_by(original_id: row[:id]).present?
          return
        end

        row
      end
    end
  end
end
