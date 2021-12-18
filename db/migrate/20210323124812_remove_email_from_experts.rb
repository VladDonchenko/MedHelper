class RemoveEmailFromExperts < ActiveRecord::Migration[6.1]
  def change
    remove_column :experts, :email, :string
  end
end
