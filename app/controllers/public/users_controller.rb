class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @post = @user.posts
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_path(current_user)
      flash[:notice] = "変更しました。"
    else
      render :edit
      flash[:alert] = "編集に失敗しました。"
    end
  end

  def index
    @users = User.page(params[:page]).per(20)
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "またの入会をお待ちしております"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :biography, :profile_image, :is_deleted)
  end

end
