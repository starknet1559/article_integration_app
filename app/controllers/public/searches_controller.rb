class Public::SearchesController < ApplicationController

  def search
    @model = params[:model]
    @content = params[:content]
    if @model == "user"
      @users = User.search_for(@content)
    elsif @model == "post"
      @posts = Post.search_for(@content)
    end
  end

end
