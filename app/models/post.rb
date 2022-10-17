class Post < ApplicationRecord

  validates :title, presence: true, length: { maximum: 30 }
  validates :content_url, presence: true
  validates :description, presence: true

  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :genre_posts, dependent: :destroy
  has_many :genres, through: :genre_posts, dependent: :destroy
  has_many :post_goods, dependent: :destroy
  has_many :post_bads, dependent: :destroy

  has_many :notifications, dependent: :destroy

  has_many :view_counts, dependent: :destroy

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

  def create_notification_by(current_user)
    temp = Notification.where(["visiter_id = ? and visited_id = ? and post_id = ? and action = ? ", current_user.id, user_id, id, 'good'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        post_id: id,
        visited_id: user_id,
        action: "good"
      )
      if notification.visiter_id == notification.visited_id
        notification.check = true
      end
      notification.save if notification.valid?
    end
  end

  def create_notification_comment!(current_user, comment_id)
    temp_ids = PostComment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    notification = current_user.active_notifications.new(
      post_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    if notification.visiter_id == notification.visited_id
      notification.check = true
    end
    notification.save if notification.valid?
  end
end
