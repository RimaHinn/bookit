class EventspacesController < ApplicationController
  def index
    @eventspaces = Eventspaces.all
  end
end
