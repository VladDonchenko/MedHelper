class CreateChildren < ActiveRecord::Migration[6.1]
  def change
    create_table :children do |t|
      t.references :user
      t.string :name
      t.datetime :birthday

      t.timestamps
    end
  end
end
