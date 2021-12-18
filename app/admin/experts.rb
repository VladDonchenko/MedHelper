ActiveAdmin.register Expert do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :full_name, :description, :experience, :additional_education, :procedure, :address, :medical_center, :email, :phone, :image, :hw_start_monday, :hw_end_monday, :hw_start_tuesday, :hw_end_tuesday, :hw_start_wednesday, :hw_end_wednesday, :hw_start_thursday, :hw_end_thursday, :hw_start_friday, :hw_end_friday, :hw_start_saturday, :hw_end_saturday, :hw_start_sunday, :hw_end_sunday, :category_id, :education, :level_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:full_name, :description, :experience, :additional_education, :procedure, :address, :medical_center, :email, :phone, :image, :hw_start_monday, :hw_end_monday, :hw_start_tuesday, :hw_end_tuesday, :hw_start_wednesday, :hw_end_wednesday, :hw_start_thursday, :hw_end_thursday, :hw_start_friday, :hw_end_friday, :hw_start_saturday, :hw_end_saturday, :hw_start_sunday, :hw_end_sunday, :category_id, :education, :level_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
