module ApplicationHelper
  def simple_time(time)
    time.strftime("%Y-%m-%d　%H:%M　")
  end
  def  page_title
    title = "シュミティア -趣味の幅をゆるーく広げるサイト- "
    title = @page_title + " | " + title if @page_title
    title
  end
end
