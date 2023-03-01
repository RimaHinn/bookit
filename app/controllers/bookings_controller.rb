class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @eventspace = Eventspace.find(params[:eventspace_id])
  end

  def create # post request doesnt need view - it's just storing to the data base
    # 1. create with a certain eventspace id ect
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    #eventspace_id can be picked up in URL or Form. URL gets it through params, picking up the instance of the current event space.
    @eventspace = Eventspace.find(params[:eventspace_id])
    @booking.eventspace = @eventspace
    @booking.status = "pending"
    # 2. save
    if @booking.save
      # 4. user will be redirected to dashboard page.
      # In a more complex app, he'd get here an email confirmation + confirmation page.
      redirect_to booking_confirmation_path(@booking) # you see the path and the prefix through: rails routes | grep booking
      # eventspace GET    /eventspaces/:id ---- this would be redirect_to eventspaces_path(@id) sendo que o @id é o que está nested.
    else
      render :new
    end
  end

  # method to generate confirmation page
  def confirmation
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at)
  end
end

# TO-DO
# Note that in order to use current_user, you must have included the Devise authenticate_user! method in your controller action or before filter to ensure that the user is authenticated before accessing the current user object.
