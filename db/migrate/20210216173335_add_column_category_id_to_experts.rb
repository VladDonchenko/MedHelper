class AddColumnCategoryIdToExperts < ActiveRecord::Migration[6.1]
  def change
    add_column :experts, :category_id, :integer
  end
end
