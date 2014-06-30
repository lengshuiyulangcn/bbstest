class NotificationsController < ApplicationController
after_filter :mark_read, :only => :index
  def index
   @notifications=current_user.notifications.order("created_at DESC")
  end
  def mark_read
    current_user.notifications.update_all(unread: false)
  end

end
