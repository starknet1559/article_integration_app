class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def index
    @posts = Post.all.page(params[:page]).per(10)

  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to admin_posts_path
      flash[:alert] = "投稿を削除しました"
    else
      render :index
    end
  end

end
