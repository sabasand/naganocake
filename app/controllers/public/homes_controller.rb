class Public::HomesController < ApplicationController
  def top
    @genres = Genre.order('id DESC').limit(8)
  end
end
