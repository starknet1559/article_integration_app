class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :post_comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :genre_likes, dependent: :destroy
  has_many :genres, through: :genre_likes, dependent: :destroy
end
