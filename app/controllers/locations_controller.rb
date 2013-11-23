class LocationsController < ApplicationController
  # TODO
  def index
  end

  # TODO?
  def show
    @location = Location.find(params[:id])
  end

  # TODO?
  def new
    @location = Location.new
  end

  def edit
    @location = Location.find(params[:id])
  end

  # TODO?
  def create
    if user_signed_in?
      @location = Location.new(params[:location])
      @location.user = current_user
      @location.save

      respond_with @location
    end
  end

  # TODO
  def update
  end

  # TODO
  def destroy
  end
end
