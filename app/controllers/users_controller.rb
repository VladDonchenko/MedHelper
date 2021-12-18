# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_user, only: %i[show]

  def show
    @user_fields_hash = {
      fio: @user.expert.full_name,
      category: @user.expert.category.name,
      description: @user.expert.description,
      level: @user.expert.level.name,
      experience: @user.expert.experience,
      education: @user.expert.education,
      add_education: @user.expert.additional_education,
      center: @user.expert.medical_center,
      procedure: @user.expert.procedure,
      phone: @user.expert.phone
    }
  end

  private

  def find_user
    @user = current_user
  end
end
