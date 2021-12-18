# frozen_string_literal: true

class ExpertsController < ApplicationController
  before_action :find_expert, only: %i[show edit update]
  before_action :correct_expert, only: %i[edit update]
  before_action :find_all_level, :find_all_category, only: %i[edit update]

  def index
    @experts = Expert.searcher(params).paginate(page: params[:page], per_page: 5)
  end

  def show; end

  def edit; end

  def update
    if @expert.update(expert_params)
      redirect_to @expert.user, success: 'Ваш профиль был изменён'
    else
      flash.now[:danger] = 'Ваш профиль не был изменён'
      render :edit
    end
  end

  private

  def find_expert
    @expert = Expert.find(params[:id])
  end

  def find_all_level
    @level = Level.all
  end

  def find_all_category
    @category = Category.all
  end

  def expert_params
    params.require(:expert).permit(:full_name, :description, :experience,
                                   :additional_education, :procedure, :address,
                                   :medical_center, :phone, :hw_start_monday,
                                   :hw_end_monday, :hw_start_tuesday,
                                   :hw_end_tuesday, :hw_start_wednesday,
                                   :hw_end_wednesday, :hw_start_thursday,
                                   :hw_end_thursday, :hw_start_friday,
                                   :hw_end_friday, :hw_start_saturday, :image,
                                   :hw_end_saturday, :hw_start_sunday, :level_id,
                                   :hw_end_sunday, :category_id, :education)
  end
end
