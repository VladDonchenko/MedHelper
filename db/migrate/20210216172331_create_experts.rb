class CreateExperts < ActiveRecord::Migration[6.1]
  def change
    create_table :experts do |t|
      t.string :full_name
      t.text :description
      t.text :level
      t.integer :experience
      t.text :additional_education
      t.text :procedure
      t.string :address
      t.string :medical_center
      t.string :email
      t.string :phone
      t.string :image
      t.string :hw_start_monday
      t.string :hw_end_monday
      t.string :hw_start_tuesday
      t.string :hw_end_tuesday
      t.string :hw_start_wednesday
      t.string :hw_end_wednesday
      t.string :hw_start_thursday
      t.string :hw_end_thursday
      t.string :hw_start_friday
      t.string :hw_end_friday
      t.string :hw_start_saturday
      t.string :hw_end_saturday
      t.string :hw_start_sunday
      t.string :hw_end_sunday

      t.timestamps
    end
  end
end
