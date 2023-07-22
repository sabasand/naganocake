class Public::HomesController < ApplicationController
  def top
    @genres = Genre.order('id DESC').limit(8)
    @items =  Item.order('id DESC').limit(4)
  end
end
