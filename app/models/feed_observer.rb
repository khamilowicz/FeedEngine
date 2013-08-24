class FeedObserver < ActiveRecord::Observer

  def before_save feed
    if users =  feed.changes[:allowed_users].try(:first)
      feed.owner.inbox.access_pleaders(users).delete_all
    end
  end
end
