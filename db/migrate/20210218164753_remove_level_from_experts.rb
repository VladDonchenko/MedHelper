class RemoveLevelFromExperts < ActiveRecord::Migration[6.1]
  def change
    remove_column :experts, :level, :text
  end
end
