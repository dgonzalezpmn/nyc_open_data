class ChangeColumnTypeToSaveSpace < ActiveRecord::Migration[7.2]
  def change
    change_column :bicycle_counters, :name, :string
    change_column :bicycle_counters, :domain, :string
    change_column :bicycle_counters, :timezone, :string
    change_column :bicycle_counters, :sens, :string
    change_column :bicycle_counters, :counter, :string
  end
end
