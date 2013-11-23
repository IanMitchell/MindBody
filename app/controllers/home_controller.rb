class HomeController < ApplicationController
  # TODO: Search Logic
  def index
    if params[:query].present?
      @tags = Tag.search(params[:query])
    else
      @tags = Tag.all
    end
  end
end
