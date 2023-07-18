class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
  end
end
