class LocationsController < ApplicationController
  respond_to :html, :js

  # TODO
  def index
  end

  # TODO?
  def show
    @location = Location.find(params[:id])
  end

  def edit
    @location = Location.find(params[:id])
  end

  # TODO?
  def create
    if user_signed_in?
      @new_location = Location.new(params[:location])
      @new_location.user = current_user
      @new_location.save

      respond_with @new_location
    end
  end

  # TODO
  def update
  end

  # TODO
  def destroy
  end
end
