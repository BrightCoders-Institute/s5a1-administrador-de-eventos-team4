# frozen_string_literal: false

# class Events
class EventsController < ApplicationController
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
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(events_params)
      redirect_to events_path index
    else
      render :edit
    end
  end

  private

  def events_params
    params.require(:event).permit(:id, :titulo, :descripcion, :fecha, :ubicacion, :costo)
  end
end
