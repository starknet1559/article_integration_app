class Public::PostsController < ApplicationController

  def new
    @post_new = Post.new
    @post_new.genre_posts.build
  end

  def create
    @post_new = Post.new(post_params)
    @post_new.user_id = current_user.id
    if @post_new.save
      redirect_to post_path(@post_new.id)
      flash[:notice] = "投稿に成功しました。"
    else
      render :new
    end
  end

  def index
     @posts = Post.page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
    @post_genres = @post.genres.all
    @post_comment = PostComment.new
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to posts_path
      flash[:alert] = "投稿を削除しました。"
    else
      @post_genres = @post.genres.all
      render :show
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :content_url, { genre_ids: [] })
  end

end
