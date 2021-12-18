ActiveAdmin.register Vaccine do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :hepatitis_a_1w, :hepatitis_a_2w, :hepatitis_b_1w, :hepatitis_b_2w, :hepatitis_b_3w, :tuberculosis, :pneumococcus_1w, :pneumococcus_2w, :pneumococcus_3w, :meningococcus_1w, :meningococcus_2w, :varicella_1w, :varicella_2w, :morbilli_mumps_rubella_1w, :morbilli_mumps_rubella_2w, :diphtheria_tetanus_pertussis_1w, :diphtheria_tetanus_pertussis_2w, :diphtheria_tetanus_pertussis_3w, :diphtheria_tetanus_pertussis_1rw, :diphtheria_tetanus_pertussis_2rw, :diphtheria_tetanus_pertussis_3rw, :hib_desease_1w, :hib_desease_2w, :hib_desease_3w, :hib_desease_4w, :rota_1w, :rota_2w, :covid19_1w, :covid19_2w
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :hepatitis_a_1w, :hepatitis_a_2w, :hepatitis_b_1w, :hepatitis_b_2w, :hepatitis_b_3w, :tuberculosis, :pneumococcus_1w, :pneumococcus_2w, :pneumococcus_3w, :meningococcus_1w, :meningococcus_2w, :varicella_1w, :varicella_2w, :morbilli_mumps_rubella_1w, :morbilli_mumps_rubella_2w, :diphtheria_tetanus_pertussis_1w, :diphtheria_tetanus_pertussis_2w, :diphtheria_tetanus_pertussis_3w, :diphtheria_tetanus_pertussis_1rw, :diphtheria_tetanus_pertussis_2rw, :diphtheria_tetanus_pertussis_3rw, :hib_desease_1w, :hib_desease_2w, :hib_desease_3w, :hib_desease_4w, :rota_1w, :rota_2w, :covid19_1w, :covid19_2w]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
