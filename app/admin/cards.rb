ActiveAdmin.register Card do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :full_name, :gender, :phone, :address, :work, :member, :comment, :user_id, :birthday, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:full_name, :gender, :phone, :address, :work, :member, :comment, :user_id, :birthday, :image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
