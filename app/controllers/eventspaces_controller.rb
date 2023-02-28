class EventspacesController < ApplicationController
  def index
    @eventspaces = Eventspace.all
  end
end
