class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :danger, :info, :warning, :primary, :secondary

  protected

  def find_doctor?
    current_user.doctor?
  end

  def find_patient?
    current_user.patient?
  end

  def correct_user
    unless find_patient?
      flash[:notice] = 'Страница не доступна'
      redirect_to home_path
    end
  end

  def correct_expert
    unless find_doctor?
      flash[:notice] = 'Страница не доступна'
      redirect_to home_path
    end
  end

  def find_owner
    unless current_user.expert == Expert.find(params[:expert_id])
      flash[:notice] = 'Страница не доступна'
      redirect_to home_path
    end
  end
end
