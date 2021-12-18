# frozen_string_literal: true

class VaccinesController < ApplicationController
  before_action :find_user, only: %i[show edit update]
  before_action :find_vaccine, only: %i[show edit update]
  before_action :correct_user, only: %i[show edit update]

  def show
    @birthday = params[:child_id].present? ? @user.birthday : @user.card.birthday
  end

  def edit; end

  def update
    @vaccines.update(vaccines_params)
    if params[:child_id].present?
      redirect_to user_child_vaccine_path(@user),
                  success: 'Карта вакцинации Вашего ребёнка обновлена'
    else
      redirect_to user_vaccine_path(@user),
                  success: 'Ваша карта вакцинации обновлена'
    end
  end

  private

  def find_user
    @user = params[:child_id].present? ? Child.find(params[:id]) : User.find(params[:id])
  end

  def find_vaccine
    @vaccines = @user.vaccine
  end

  def vaccines_params
    params.permit(:hepatitis_a_1w, :hepatitis_a_2w, :hepatitis_b_1w,
                  :hepatitis_b_2w, :hepatitis_b_3w, :tuberculosis,
                  :pneumococcus_1w, :pneumococcus_2w, :pneumococcus_3w,
                  :meningococcus_1w, :meningococcus_2w, :varicella_1w,
                  :varicella_2w, :morbilli_mumps_rubella_1w, :hib_desease_3w,
                  :morbilli_mumps_rubella_2w, :diphtheria_tetanus_pertussis_1w,
                  :diphtheria_tetanus_pertussis_2w, :hib_desease_1w,
                  :diphtheria_tetanus_pertussis_3w, :hib_desease_4w, :rota_1w,
                  :diphtheria_tetanus_pertussis_1rw, :hib_desease_2w,
                  :diphtheria_tetanus_pertussis_2rw, :rota_2w,
                  :diphtheria_tetanus_pertussis_3rw, :covid19_1w, :covid19_2w,
                  :hib_desease_2w, :hib_desease_3w)
  end
end
