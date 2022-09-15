class Public::GenreLikesController < ApplicationController

  def create
    genre = Genre.find(params[:genre_id])
    genre_like = current_user.genre_likes.new(genre_id: genre.id)
    genre_like.save
    redirect_to request.referer
  end

  def destroy
    genre = Genre.find(params[:genre_id])
    genre_like = current_user.genre_likes.find_by(genre_id: genre.id)
    genre_like.destroy
    redirect_to request.referer
  end

end
