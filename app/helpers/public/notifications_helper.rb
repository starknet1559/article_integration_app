module Public::NotificationsHelper

  def notification_form(notification)
    @visiter = notification.visiter
	  @visiter_comment = notification.comment_id

	  case notification.action
	    when "follow" then
	      tag.a(@visiter.name, href:user_path(@visiter))+"があなたをフォローしました"
	    when "good" then
	      tag.a(@visiter.name, href:user_path(@visiter))+"が"+tag.a('あなたの投稿', href:post_path(notification.post_id))+"にいいねしました"
	    when "comment" then
	    	@comment = PostComment.find_by(id: notification.comment_id)&.comment
	    	tag.a(@visiter.name, href:user_path(@visiter))+"が"+tag.a('あなたの投稿', href:post_path(notification.post_id))+"にコメントしました"
	  end
  end

  def uncheck_notifications
    @notifications = current_user.passive_notifications.where(check: false)
  end
end
