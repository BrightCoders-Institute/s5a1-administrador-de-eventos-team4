# frozen_string_literal: false

# class Events
class EventsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_event, only: [:edit, :destroy, :update]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.event.create(events_params)

    if @event.save
      redirect_to events_index_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @event = Event.user_event(current_user)
  end

  def public
    @event = Event.where(privado: false)
  end

  def edit
  end

  def update
    if @event.update(events_params)
      redirect_to events_index_path
    else
      render :edit
    end
  end

  def destroy
    @event.destroy

    redirect_to events_index_path
  end

  def set_event
    @event = Event.find(params[:id])
  end

  private

  def events_params
    params.require(:event).permit(:id, :titulo, :descripcion, :fecha, :ubicacion, :costo, :privado, :user_id)
  end
end
