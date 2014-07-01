class ApplicationController < ActionController::Base
  protect_from_forgery
before_filter :count_unread_notification
helper_method :format_date, :formate_time
def format_time(time)
    time.strftime("%Y-%m-%d %H:%M")
  end

  def format_date(time)
    time.strftime("%Y.%m.%d")
  end
private

 def count_unread_notification
    if current_user
      @unread_count = current_user.notifications.where(unread: true).count
    else
      @unread_count = 0
    end
  end
end
