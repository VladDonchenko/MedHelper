require 'open-uri'
class Users::RegistrationsController < Devise::RegistrationsController
  def create
    cookies[:user_type] = params[:user][:type]
    redirect_to user_google_oauth2_omniauth_authorize_path
  end

  def edit; end

  def update
    case params[:user][:type]
    when 'doctor'
      @user.doctor!
      assign_image_doctor
    else
      @user.patient!
      assign_image_patient
    end
    redirect_to home_path
  end

  private

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
