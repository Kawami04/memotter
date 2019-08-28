class FavoritesController < ApplicationController
  def index
    @favorite_memos = current_user.favorite_memos
  end

  # def show
  #   @favorite_memos = current_user.favorite_memos
  # end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.memo_id = params[:memo_id]

    if favorite.save
      redirect_to memos_path, success: 'お気に入りに登録しました'
    else
      redirect_to memos_path, danger: 'お気に入りに登録に失敗しました'
    end
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, memo_id: params[:memo_id])

    if favorite.destroy
      redirect_to memos_path, success: 'お気に入り削除しました'
    else
      redirect_to memos_path, danger: 'お気に入りの削除に失敗しました'
    end
  end
end
