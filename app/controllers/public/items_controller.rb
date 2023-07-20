class Public::ItemsController < ApplicationController
  # 商品一覧
  def index
    @items = Item.page(params[:page]).per(8)    # Itemの取得、1ページに8件表示
    @item_count = Item.all.count                # Itemeの件数取得用
    @genres = Genre.all                         # Genreをすべて取得
  end

  # 商品詳細
  def show
     @item = Item.find(params[:id])    # Itemの取得
     @cart_item = CartItem.new         # 商品をカートに追加できるようにインスタンス変数に空のModelオブジェクトを生成
     @genres = Genre.all               # Genreをすべて取得
  end
end
