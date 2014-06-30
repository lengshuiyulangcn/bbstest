class ApplicationController < ActionController::Base
  protect_from_forgery
before_filter :count_unread_notification

private

 def count_unread_notification
    if current_user
      @unread_count = current_user.notifications.where(unread: true).count
    else
      @unread_count = 0
    end
  end
end
