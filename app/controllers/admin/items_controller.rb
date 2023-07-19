class Admin::ItemsController < ApplicationController

  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @item = Item.new
  end

  # 商品一覧
  def index
    @items = Item.all
  end

  # 商品新規登録：作成データの保存
  def create
    @item = Item.new(item_params)
    # バリデーション設定（カラムが存在しているかのチェック）
    if @item.save
        # 新規投稿が成功したとき:フラッシュメッセージ
        flash[:notice] = "新規登録が完了しました。"
        # 新規登録に成功したら「商品詳細」に遷移する。
        redirect_to admin_item_path(@item)
    else
        flash[:danger] = "登録内容に不備があります。"
        @items = @item.all
        render :new
    end
  end

  # 商品詳細
  def show
     @item = Item.find(params[:id])    # Itemの取得
  end

  # 商品編集
  def edit
    @item = Item.find(params[:id])    # Itemの取
  end

  # 更新処理
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      # 変更が成功したとき:フラッシュメッセージ
       flash[:notice] = "変更が完了しました。"
       redirect_to admin_item_path(@item.id)   # 商品詳細ページへのパス
    else
       # 変更が成功したとき:フラッシュメッセージ
       flash[:notice] = "変更内容に不備があります。"
       render :edit
    end
  end

  private

  # 作成データのストロングパラメータ（ユーザーから送信されるデータを制限する機能）の設定
  def item_params
    # 設定内容：商品名、商品説明、ジャンルID、税抜価格、販売ステータス
    params.require(:item).permit(:name, :description, :genre_id, :price, :is_active, :image )
  end
end
