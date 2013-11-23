class HomeController < ApplicationController
  def index
    @new_location = Location.new

    if params[:query].present?
      @locations = Location.search params[:query], partial: true
      @tags = Tag.search params[:query], partial: true
    else
      @locations = Location.all
    end
  end

  def autocomplete
    render json: Tag.search(params[:query], autocomplete: true, limit: 10).map(&:name)
  end
end
