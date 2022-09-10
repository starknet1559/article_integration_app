class Post < ApplicationRecord

  validates :title, presence: true
  validates :content_url, presence: true
  validates :description, presence: true

  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :genre_posts, dependent: :destroy
  has_many :genres, through: :genre_posts, dependent: :destroy
  has_many :post_goods, dependent: :destroy
  has_many :post_bads, dependent: :destroy

  def post_good_by?(user)
    post_goods.exists?(user_id: user.id)
  end

  def post_bad_by?(user)
    post_bads.exists?(user_id: user.id)
  end

end
