# frozen_string_literal: false

# class Events
class EventsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_event, only: [:edit, :destroy, :update]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.create(events_params)

    if @event.save
      redirect_to events_index_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @date = params[:fecha]
    @private = params[:privado]

    filter
    filer_private
  end

  def filter
    if @date
      @event = Event.user_event(current_user).where(fecha: @date)
      @date = ''
    else
      @event = Event.user_event(current_user)
    end
  end

  def filer_private
    @event = Event.user_event(current_user).where(privado: @private) if @private
    @private = ''
  end

  def public
    @date = params[:fecha]
    if @date
      @event = Event.where(fecha: @date, privado: false)
      @date = ''
    else
      @event = Event.where(privado: false)
    end
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

  def destroy_foto
    @event = Event.find(params[:id])
    @event.foto.destroy
    redirect_back fallback_location: events_index_path, notice: 'succes'
  end

  def set_event
    @event = Event.find(params[:id])
  end

  private

  def events_params
    params.require(:event).permit(
      :id, :titulo, :descripcion, :fecha, :ubicacion, :latitud, :longitud, :costo, :privado, :user_id, :foto
    )
  end
end
