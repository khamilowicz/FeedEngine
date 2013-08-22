class FeedObserver < ActiveRecord::Observer

  def before_save feed
    if feed.changed? && feed.changes[:allowed_users]
      users =  feed.changes[:allowed_users].first
      unless users.empty?
        owner = feed.owner
        owner.inbox.access_requests.where(sender_id: users.map(&:id)).delete_all
      end
    end
  end
end
