ActiveAdmin.register Protocol do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :complaint, :therapy, :diagnosis, :state, :symptom, :anamnesis_of_life, :medical_history, :type_of_inspection, :card_id, :expert_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:complaint, :therapy, :diagnosis, :state, :symptom, :anamnesis_of_life, :medical_history, :type_of_inspection, :card_id, :expert_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
