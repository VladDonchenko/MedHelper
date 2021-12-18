class AddUserIdToExperts < ActiveRecord::Migration[6.1]
  def change
    add_reference :experts, :user, null: false, foreign_key: true
  end
end
