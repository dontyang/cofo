module ApplicationHelper
  def show_time(time)
    if time.present?
      time.to_s(:db)
    end
  end
end
