# frozen_string_literal: true

class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token

  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])
    auth = request.env['omniauth.auth']
    @user.access_token = auth.credentials.token
    @user.expires_at = auth.credentials.expires_at
    @user.refresh_token = auth.credentials.refresh_token
    @user.save!
    assign_role
    sign_in(:user, @user)
    if @user.role?
      redirect_to home_path
    else
      redirect_to edit_user_registration_path
    end
  end

  private

  def assign_role
    case cookies[:user_type]
    when 'doctor'
      @user.doctor!
      assign_image_doctor
    else
      @user.patient!
      assign_image_patient
    end
    cookies.delete :user_type
  end

  def assign_image_doctor
    @expert = assign_expert
    @expert.image.attach(io: File.open('app/assets/images/doctor0.png'), filename: 'doctor0.png')
  end

  def assign_image_patient
    @card = assign_card
    @card.image.attach(io: File.open('app/assets/images/avatar.png'), filename: 'avatar.png')
    assign_vaccine
  end

  def assign_expert
    Expert.create!(full_name: @user.name, category: Category.first, user: @user, level: Level.first)
  end

  def assign_card
    Card.create(user_id: @user.id, birthday: Time.now.strftime('%d/%m/%Y'), full_name: @user.name)
  end

  def assign_vaccine
    Vaccine.create(user_id: @user.id)
  end
end
