class Public::PostBadsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    post_bad = current_user.post_bads.new(post_id: post.id)
    if post_good = current_user.post_goods.find_by(post_id: post.id)
      post_good.destroy
    end
    post_bad.save
    redirect_to request.referer
  end

  def destroy
    post = Post.find(params[:post_id])
    post_bad = current_user.post_bads.find_by(post_id: post.id)
    post_bad.destroy
    redirect_to request.referer
  end

end
