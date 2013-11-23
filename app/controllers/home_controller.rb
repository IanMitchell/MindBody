class HomeController < ApplicationController
  def index
    if params[:query].present?
      @results = Array.new

      @locations = Location.search params[:query], partial: true
      @tags = Tag.search params[:query], partial: true

      @locations.each do |loc|
        @results << loc
      end

      add = true
      @tags.each do |tag|
        tag.locations.each do |tag_loc|
          @results.each do |loc|
            add = false if loc.name == tag_loc.name
          end
          @results << tag_loc if add
          add = true
        end
      end
    else
      @results = Location.all
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
