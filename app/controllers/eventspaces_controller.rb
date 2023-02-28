class EventspacesController < ApplicationController
  before_action :set_event_space

  def index
    @eventspaces = Eventspace.all
  end

  def show
    # @event_space = Eventspace.find(params[:id])
  end

  def new
    @event_space = Eventspace.new
  end

  def create
    @event_space = Eventspace.new(event_space_params)
    @event_space.user = current_user
    if @event_space.save
      redirect_to event_space_path(@vent_space)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @event_space = Eventspace.find(params[:id])
  end

  def update
    # @event_space = Eventspace.find(params[:id])
    @event_space = Eventspace.update(event_space_params)
    redirect_to event_space_path(@event_space)
  end

  def destroy
    # @list = List.find(params[:id])
    @event_space.destroy
    redirect_to event_space_path, status: :see_other
  end

  private

  def set_event_space
    @event_space = Eventspace.find(params[:id])
  end

  def event_space_params
    params.require(:event_space).permit(:name, :address)
  end
end
