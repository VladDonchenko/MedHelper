# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_user, only: %i[show]

  def show
    
  end

  private

  def find_user
    @user = current_user
  end
end
