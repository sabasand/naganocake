class Admin::GenresController < ApplicationController

  def new
    @genre = Genre.new
  end

  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to action: :index
  end

  def index
    @genres = Genre.all
  end

  def show
    redirect_to action: :index
  end

  def edit
    @genre = Genre.find_by(id: params[:id])
  end

  def update
    genre = Genre.find_by(id: params[:id])
    genre.update(genre_params)
    redirect_to admin_genres_path

  end

private
  def genre_params
    params.permit(:name)
  end
end
