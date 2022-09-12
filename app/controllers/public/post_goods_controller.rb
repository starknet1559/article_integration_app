class Public::PostGoodsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    @post_good = current_user.post_goods.new(post_id: post.id)
    if post_bad = current_user.post_bads.find_by(post_id: post.id)
      post_bad.destroy
    end
    @post_good.save
  end

  def destroy
    post = Post.find(params[:post_id])
    @post_good = current_user.post_goods.find_by(post_id: post.id)
    @post_good.destroy
  end

end
