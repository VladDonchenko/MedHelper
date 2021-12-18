class AddLevelIdToExperts < ActiveRecord::Migration[6.1]
  def change
    add_column :experts, :level_id, :integer
  end
end
