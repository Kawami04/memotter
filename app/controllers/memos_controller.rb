class MemosController < ApplicationController
  def index
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

  def destroy
    @memo = Memo.find_by(id: params[:id])
    @memo.destroy
    redirect_to memos_path
  end


  def show
    @memo = Memo.find_by(id: params[:id])
  end

  def edit
    @memo = Memo.find_by(id: params[:id])
  end

  def update
    @memo = Memo.find_by(id_params)
    # binding.pry
    @memo.update(memo_params)
    redirect_to memos_path
  end

  private
  def memo_params
    params.require(:memo).permit(:main)
  end

  def id_params
    params.permit(:id)
  end
end
