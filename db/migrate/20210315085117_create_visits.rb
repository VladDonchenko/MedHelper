class CreateVisits < ActiveRecord::Migration[6.1]
  def change
    create_table :visits do |t|
      t.string :complaint
      t.string :therapy
      t.string :diagnosis
      t.string :state
      t.string :symptom
      t.string :anamnesis_of_life
      t.string :medical_history
      t.references :event, null: false, foreign_key: true
      t.integer :type_of_inspection

      t.timestamps
    end
  end
end
