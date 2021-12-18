class CreateVaccines < ActiveRecord::Migration[6.1]
  def change
    create_table :vaccines do |t|
      t.integer :user_id
      t.datetime :hepatitis_a_1w
      t.datetime :hepatitis_a_2w
      t.datetime :hepatitis_b_1w
      t.datetime :hepatitis_b_2w
      t.datetime :hepatitis_b_3w
      t.datetime :tuberculosis
      t.datetime :pneumococcus_1w
      t.datetime :pneumococcus_2w
      t.datetime :pneumococcus_3w
      t.datetime :meningococcus_1w
      t.datetime :meningococcus_2w
      t.datetime :varicella_1w
      t.datetime :varicella_2w
      t.datetime :morbilli_mumps_rubella_1w
      t.datetime :morbilli_mumps_rubella_2w
      t.datetime :diphtheria_tetanus_pertussis_1w
      t.datetime :diphtheria_tetanus_pertussis_2w
      t.datetime :diphtheria_tetanus_pertussis_3w
      t.datetime :diphtheria_tetanus_pertussis_1rw
      t.datetime :diphtheria_tetanus_pertussis_2rw
      t.datetime :diphtheria_tetanus_pertussis_3rw
      t.datetime :hib_desease_1w
      t.datetime :hib_desease_2w
      t.datetime :hib_desease_3w
      t.datetime :hib_desease_4w
      t.datetime :rota_1w
      t.datetime :rota_2w
      t.datetime :covid19_1w
      t.datetime :covid19_2w
      t.timestamps
    end
  end
end
