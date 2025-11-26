module Etl
  module Transforms
    module PrimaryDb
      class FilterExistingRecordsTransform
        def process(row)
          ::DepartmentOfTransportation::BicycleCounter
            .find_by(original_id: row[:id])
            .blank? ? row : nil
        end
      end
    end
  end
end
