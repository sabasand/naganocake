class Admin::GenresController < ApplicationController

  def create
    @genre = Genre.new(genre_params)
    render 'index'
  end

  def index
    @genre  = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    render "index"
  end

private
  def genre_params
    params.require(:genres).permit(:name)
  end
end
