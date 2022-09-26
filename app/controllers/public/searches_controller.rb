class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params[:model]
    @content = params[:content]
    if @model == "user"
      @users = User.search_for(@content)
      if @users.count == 0
        redirect_to request.referer
        flash[:alert] = "ユーザーが見つかりませんでした"
      end
    elsif @model == "post"
      @posts = Post.search_for(@content)
      if @posts == 0
        redirect_to request.referer
        flash[:alert] = "投稿が見つかりませんでした"
      end
    end
  end

end
