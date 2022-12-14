class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.active.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(10)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_path(current_user)
      flash[:notice] = "変更しました"
    else
      flash[:alert] = "編集に失敗しました"
      render :edit
    end
  end

  def index
    @users = User.active.page(params[:page]).per(10)
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_deleted: true)
    @user.post_comments.destroy_all
    @user.followings.destroy_all
    @user.followers.destroy_all
    @user.active_notifications.destroy_all
    @user.post_goods.destroy_all
    reset_session
    flash[:notice] = "またの入会をお待ちしております"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :biography, :profile_image, :is_deleted)
  end

end
