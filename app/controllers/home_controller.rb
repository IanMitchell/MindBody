class HomeController < ApplicationController
  # TODO: Search Logic
  def index
    if params[:query].present?
      @tags = Tag.search(params[:query])
    else
      @tags = Tag.all
    end
  end

  def autocomplete
    render json: Tag.search(params[:query], autocomplete: true, limit: 10).map(&:name)
  end
end
