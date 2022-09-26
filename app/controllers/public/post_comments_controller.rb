class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.post_id = post.id
    if @comment.save
      @comment.post.create_notification_comment!(current_user, @comment.id)
      redirect_to request.referer
    end
  end

  def destroy
    @comment = PostComment.find_by(id: params[:id], post_id: params[:post_id])
    @comment.destroy
  end

   private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
