class AddLevelStatusToLevels < ActiveRecord::Migration[6.1]
  def change
    add_column :levels, :level_status, :integer
  end
end
