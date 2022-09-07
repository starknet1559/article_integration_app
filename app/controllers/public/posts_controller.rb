class Public::PostsController < ApplicationController
  
  def new
    @post_new = Post.new
  end
  
  def create
    @post_new = Post.new(post_params)
    @post_new.user_id = current_user.id
    if @post_new.save
      redirect_to post_path(params[:id])
      flash[:notice] = "投稿に成功しました。"
    else
      render :new
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :description, :content_url)
  end
  
end
