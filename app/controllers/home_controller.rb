class HomeController < ApplicationController
  def index
    if params[:query].present?
      @locations = Location.search params[:query], partial: true
      @tags = Tag.search params[:query], partial: true
    else
      @locations = Location.all
    end
  end

  def autocomplete
    results = Array.new
    results = Location.search(params[:query], autocomplete: true, limit: 3).map(&:name)
    Tag.search(params[:query], autocomplete: true, limit: 7).map(&:name).each do |str|
      results << str
    end

    render json: results
  end
end
