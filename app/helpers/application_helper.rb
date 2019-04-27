module ApplicationHelper

  def show_time(time)
    time.to_s(:db) if time.present?
  end

  def show_date(date)
    date.strftime("%Y年%m月%d日") if date.present?
  end
end
