class AddEducationToExperts < ActiveRecord::Migration[6.1]
  def change
    add_column :experts, :education, :text
  end
end
