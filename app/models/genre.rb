class Genre < ApplicationRecord

  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }

  has_many :genre_posts, dependent: :destroy
  has_many :posts, through: :genre_posts, dependent: :destroy
  has_many :genre_likes, dependent: :destroy
  has_many :users, through: :genre_likes, dependent: :destroy

  def genre_likes_by?(user)
    genre_likes.exists?(user_id: user.id)
  end

end
