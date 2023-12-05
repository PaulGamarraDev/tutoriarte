class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def new
    # cargar datos adicionales para el formulario
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    if @booking.save
      flash[:success] = 'Reserva creada exitosamente.'
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # La acción edit puede utilizar el before_action :set_booking
  end

  def update
    if @booking.update(booking_params)
      flash[:success] = 'Reserva actualizada exitosamente.'
      redirect_to booking_path(@booking)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    flash[:success] = 'Reserva eliminada exitosamente.'
    redirect_to bookings_path
  end

  def show
    # La acción show puede utilizar el before_action :set_booking
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date, :time_in, :time_out, :subject_id)
  end

end

