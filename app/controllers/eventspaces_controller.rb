class EventspacesController < ApplicationController
  before_action :set_event_space, only: %i[show edit destroy]

  def index
    if params[:query].present?
      @eventspaces = Eventspace.where("name ILIKE :query OR address ILIKE :query OR description ILIKE :query", query: "%#{params[:query]}%")
    else
      @eventspaces = Eventspace.all
    end
  end

  def show
    # @event_space = Eventspace.find(params[:id])
    @booking = Booking.new
  end

  def new
    @eventspace = Eventspace.new
  end

  def create
    @eventspace = Eventspace.new(event_space_params)
    @eventspace.user = current_user
    if @eventspace.save
      redirect_to eventspace_path(@eventspace)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @event_space = Eventspace.find(params[:id])
  end

  def update
    # @event_space = Eventspace.find(params[:id])

    @eventspace = Eventspace.update(event_space_params)
    redirect_to eventspace_path(@eventspace)
  end

  def destroy
    # @list = List.find(params[:id])
    @eventspace.destroy
    redirect_to event_space_path, status: :see_other
  end

  def select
    @user_eventspaces = Eventspace.where(user: current_user)
  end

  private

  def set_event_space
    @eventspace = Eventspace.find(params[:id])
  end

  def event_space_params
    params.require(:eventspace).permit(:name, :address, :price, :description, photos: [])
  end
end
