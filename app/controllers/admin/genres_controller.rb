class Admin::GenresController < ApplicationController

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to action: :index
    else
      flash.now[:alert] = "登録できませんでした。"
      @genres = Genre.all
      render action: :index
    end
  end

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def show
    redirect_to action: :index
  end

  def edit
    @genre = Genre.find_by(id: params[:id])
  end

  def update
    @genre = Genre.find_by(id: params[:id])
    if @genre.update(genre_params)
      redirect_to action: :index
    else
      flash.now[:alert] = "更新できませんでした。"
      @genres = Genre.all
      render action: :index
    end
  end

private
  def genre_params
#params.permit(:name)
    params.require(:genre).permit(:name)
  end
end
