class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :initiate_payment, :process_payment]



  def index
    @bookings = Booking.all
  end

  def new
    # cargar datos adicionales para el formulario
    @booking = Booking.new
    @subjects = Subject.all
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      # @booking.reload
      redirect_to initiate_payment_booking_path(@booking), notice: 'Realiza tu pago.'
    else
      render :new, status: :unprocessable_entity
    end
    
  end


  def initiate_payment
    @booking = Booking.find(params[:id])
  
    if @booking.present?
      if request.post?
        # Realiza aquí la lógica de procesamiento de pago
        # Si el pago es exitoso, actualiza el estado de la reserva a true
        @booking.update(status: true)
  
        redirect_to bookings_path, notice: "Reserva creada exitosamente"
      else
        flash.now[:error] = 'Error en la información de pago. Corrige los errores.'
        render :initiate_payment
      end
    else
      flash[:error] = 'Error: No se pudo obtener la información de la reserva.'
      redirect_to root_path
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
    puts "Eliminando reserva #{params[:id]}"  # Agrega este mensaje de depuración
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_path, notice: 'La reserva ha sido eliminada exitosamente.' }
      format.json { head :no_content }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@booking) }
    end
  end

  def show
    @bookings = [@booking]
    # La acción show puede utilizar el before_action :set_booking
  end

  private

  def set_booking
    @booking = params[:id] == 'initiate_payment' ? nil : Booking.find(params[:id])
  end

  # def set_booking
  #   @booking = Booking.find(params[:id])
  # end

  def booking_params
    params.require(:booking).permit(:date, :time_in, :time_out, :subject_id)
  end

  def payment_params
    params.require(:payment).permit(:nombre_tarjeta, :numero_tarjeta)
  end

end

