# frozen_string_literal: true

class ProtocolsController < ApplicationController
  before_action :find_user, only: %i[new create]
  before_action :find_card, only: %i[new create]
  before_action :correct_expert, only: %i[new create]

  def new
    @protocol = Protocol.new
  end

  def create
    @protocol = @card.protocols.build(permit_params)
    if @protocol.save
      redirect_to user_card_path(@user, @card), success: 'Протокол пациента создан'
    else
      flash.now[:error] = 'При создании протокола пациента возникли ошибки'
      render 'new'
    end
  end

  def show
    @protocol = Protocol.find(params[:id])
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_card
    @card = Card.find(params[:card_id])
  end

  def permit_params
    params.permit(:complaint, :therapy, :diagnosis, :state, :symptom,
                  :anamnesis_of_life, :medical_history, :type_of_inspection)
          .merge(expert_id: current_user.expert.id)
  end
end
