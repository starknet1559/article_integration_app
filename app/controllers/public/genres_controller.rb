class Public::GenresController < ApplicationController

  def index
    @genres = Genre.all
    @genre_new = Genre.new
  end

  def create
    @genre_new = Genre.new(genre_params)
    if @genre_new.save
      redirect_to genres_path
      flash[:notice] = "ジャンルタグを追加しました。"
    else
      @genres = Genre.all
      render :index
    end
  end

  def show
    @genre_list = current_user.genres.all
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
