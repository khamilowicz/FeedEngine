module Lockable

  def self.included receiver
    receiver.instance_eval do 
      extend ClassMethods
      include InstanceMethods
      has_many :allowed_users_feeds, class_name: 'AllowedUsersFeeds'
      has_many :allowed_users, through: :allowed_users_feeds, after_add: :mark_change 

      after_create :allow_owner 
    end
  end

  module InstanceMethods

    def mark_change user
      @changed_attributes[:allowed_users] ||= []
      @changed_attributes[:allowed_users] += [user]
    end

    def allow? user
      public? || allowed_users.where(id: user.id).exists?
    end

    def allow user
      self.allowed_users << user
      self
    end

    def allow_owner
      allowed_users << owner
    end

    def lock
      self.public = false
      save
      self
    end
  end

  module ClassMethods
    def lock feed
      feed.lock
    end
  end
end