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
    set_event
  end

  def update
    set_event
    if @event.update(events_params)
      redirect_to events_path index
    else
      render :edit
    end
  end

  def destroy
    set_event
    @event.destroy

    redirect_to events_path index, notice: 'Tu evento se a eliminado correctamente', status: :see_other
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def events_params
    params.require(:event).permit(:id, :titulo, :descripcion, :fecha, :ubicacion, :costo)
  end
end
