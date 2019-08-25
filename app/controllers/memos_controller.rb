class MemosController < ApplicationController
  def index
    @memos = Memo.all
  end
  def new
    @memo = Memo.new
  end

  def create
    @memo = current_user.memos.new(memo_params)

    if @memo.save
      redirect_to memos_path, success: "メモしました"
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def show
    @memo = Memo.find_by(id: params[:id])
  end

  private
  def memo_params
    params.require(:memo).permit(:main)
  end
end
