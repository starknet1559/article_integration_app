class Post < ApplicationRecord

  validates :title, presence: true
  validates :content_url, presence: true
  validates :description, presence: true

  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :genre_posts, dependent: :destroy
  has_many :genres, through: :genre_posts, dependent: :destroy

end
