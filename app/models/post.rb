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

  scope :active_post, -> { joins(:user).where(user_id: User.where(is_deleted: false)) }
  scope :created_this_week, -> { where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) }

  def post_good_by?(user)
    post_goods.where(user_id: user.id).exists?
  end

  def post_bad_by?(user)
    post_bads.where(user_id: user.id).exists?
  end

  def self.search_for(content)
    Post.active_post.where(['title LIKE ?', "%#{content}%"])
  end

end
