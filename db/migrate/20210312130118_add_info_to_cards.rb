class AddInfoToCards < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :full_name, :string
    add_column :cards, :gender, :string
    add_column :cards, :email, :string
    add_column :cards, :address, :string
    add_column :cards, :work, :string
    add_column :cards, :member, :string
    add_column :cards, :comment, :string
    add_reference :cards, :user, foreign_key: true
    add_reference :cards, :expert, foreign_key: true
  end
end
