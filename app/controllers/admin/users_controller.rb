class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all.page(params[:page]).per(15)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def update
    if params[:sort_update]
      user = User.find(params[:id])
      user.update(is_deleted: true)
      user.post_comments.destroy_all
      user.followings.destroy_all
      user.followers.destroy_all
      user.active_notifications.destroy_all
      user.post_goods.destroy_all
      redirect_to request.referer
    else
      user = User.find(params[:id])
      user.update(is_deleted: false)
      redirect_to request.referer
    end
  end

end
