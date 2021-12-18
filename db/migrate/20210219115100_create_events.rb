class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :user_id
      t.integer :expert_id
      t.string :name
      t.integer :phone
      t.string :email
      t.datetime :time
      t.string :comment

      t.timestamps
    end
  end
end
