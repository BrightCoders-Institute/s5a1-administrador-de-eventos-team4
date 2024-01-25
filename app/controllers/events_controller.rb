# frozen_string_literal: false

# class Events
class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(events_paramas)

    if @event.save
      redirect_to '/views/events/index'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @event = Event.all
  end

  private

  def events_paramas
    params.require(:event).permit(:Titulo, :Descripcion, :Fecha, :Ubicacion, :Costo)
  end
end
