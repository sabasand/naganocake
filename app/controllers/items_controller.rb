class ItemsController < ApplicationController
    def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @item = Item.new
  end

  def index
    @items = Item.all
    @item =Item.new
  end

  # 作成データの保存
  def create
    @item = Item.new(item_params)

    # バリデーション設定
    if @item.save
      # 新規投稿が成功したとき:フラッシュメッセージ
      flash[:notice] = "You have created item successfully."
      redirect_to item_path(@item.id)
    else
      @items = @item.all
      render :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :genre_id, :price, :is_active )
  end
end
