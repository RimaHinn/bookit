class EventspacesController < ApplicationController
  before_action :set_event_space, only: [:show, :edit, :destroy]

  def index
    @eventspaces = Eventspace.all


  end

  def show
    # @event_space = Eventspace.find(params[:id])
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
    params.require(:event_space).permit(:name, :address, :user_id)
  end
end
