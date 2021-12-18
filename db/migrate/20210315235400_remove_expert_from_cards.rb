class RemoveExpertFromCards < ActiveRecord::Migration[6.1]
  def change
    remove_reference :cards, :expert, null: false, foreign_key: true
  end
end
