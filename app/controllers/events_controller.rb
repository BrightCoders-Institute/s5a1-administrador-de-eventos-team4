# frozen_string_literal: false

# class Events
class EventsController < ApplicationController

  before_action :set_event, only: [:edit, :destroy, :update]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(events_params)

    if @event.save
      redirect_to events_path index
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @event = Event.all
  end

  def edit
  end

  def update
    if @event.update(events_params)
      redirect_to events_path index
    else
      render :edit
    end
  end

  def destroy
    @event.destroy

    redirect_to events_path index, notice: 'Tu evento se a eliminado correctamente', status: :see_other
  end

  def set_event
    @event = Event.find(params[:id])
  end

  private

  def events_params
    params.require(:event).permit(:id, :titulo, :descripcion, :fecha, :ubicacion, :costo)
  end
end
