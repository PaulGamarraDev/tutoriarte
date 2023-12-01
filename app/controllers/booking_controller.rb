class BookingController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def new
    # cargar datos adicionales para el formulario
    @booking = booking.new
  end

  def create
    @booking = booking.new (booking_params)
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
    if booking.update(booking_params)
      flash[:success] = "Reserva actualizada exitosamente."
      redirect_to booking_path(@booking)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    flash[:success] = "Reserva eliminada exitosamente"
    redirect_to booking_path
  end

  def show
    # La acción edit puede utilizar el before_action :set_booking
  end

  def index
    @booking = Booking.all
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date, :time_in, :time_out, :subject_id)
  end
end





































#   before_action :set_booking, only: [:show, :edit, :update, :destroy]


