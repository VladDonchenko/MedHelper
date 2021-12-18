# frozen_string_literal: true

class EventsController < ApplicationController
  include EventsHelper
  before_action :find_expert, only: %i[index update], if: :find_doctor?
  before_action :find_expert, only: %i[new create update], if: :find_patient?
  before_action :find_patient_event, only: %i[index], if: :find_patient?
  before_action :find_doctor_event, only: %i[index], if: :find_doctor?
  before_action :find_owner, only: %i[index], if: :find_doctor?

  def index; end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.events.build(expert: @expert)
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:notice] = 'Заявка отправлена успешно! Ожидайте подтверждения врача!'
      redirect_to expert_event_path(@expert, @event)
    else
      render 'new'
    end
  end

  def update
    @expert = Expert.find(params[:expert_id])
    @event = Event.find(params[:id])
    if params[:q] == 'approve'
      @links = google_event(@event)
      @event.approve!
      @event.update(calendar_link: @links.first, meeting_link: @links.second)
    else
      @event.rejected!
    end
    redirect_to expert_events_path(@expert)
  end

  def check_time
    @time = params[:time]
    expert = Expert.find(params[:expert_id])
    @avail_time = available_time(expert, @time)
    render partial: 'time_slots'
  end

  private

  def find_patient_event
    @events = current_user.events
  end

  def find_doctor_event
    @expert = Expert.find(params[:expert_id])
    @events = @expert.events
  end

  def find_expert
    @expert = Expert.find(params[:expert_id])
  end

  def event_params
    p = params.require(:event).permit(:start_time, :comment, :type_of_call,
                                      :end_time).merge(expert_id: @expert.id)
    p[:end_time] = p[:start_time].to_datetime + 1.hour
    p[:status] = 'pending'
    p
  end
end
