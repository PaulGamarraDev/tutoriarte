class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :initiate_payment, :process_payment]



  def index
    @bookings = Booking.all
  end

  def new
    # cargar datos adicionales para el formulario
    @booking = Booking.new
    # @subjects = Subject.all
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      # @booking.reload
      redirect_to initiate_payment_booking_path(@booking), notice: 'Reserva creada exitosamente.'
    else
      render :new, status: :unprocessable_entity
    end
    
  end


  def initiate_payment
    if @booking
      # redirect_to root_path, alert: 'Esta reserva ya ha sido pagada.' if @booking.paid?
      # @payment = Payment.new

      if request.post?
        if @payment.update(payment_params)
          @booking.update(paid: true)
          flash[:notice] = '¡Pago exitoso! Reserva completada.'
          redirect_to root_path
        else
          flash.now[:error] = 'Error en la información de pago. Corrige los errores.'
        end
      end
    else
      flash[:error] = 'Error: No se pudo obtener la información de la reserva.'
      redirect_to root_path
    end
  end

  def process_payment
    if @booking.update(payment_params.merge(status: 'Pago Pendiente'))
      redirect_to bookings_path, notice: 'Reserva creada y pago iniciado exitosamente.'
    else
      render 'initiate_payment', alert: 'Error al procesar el pago.'
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

