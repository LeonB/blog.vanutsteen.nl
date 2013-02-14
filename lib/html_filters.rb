# require "html_truncator"

module HtmlFilters

  # Like the Rails _truncate_ helper but doesn't break HTML tags or entities.
  # def truncate_html(text, max_length = 30, ellipsis = "...")
  #   return if text.nil?
  #   return HTML_Truncator.truncate(text, max_length, ellipsis)
  # end

  def strip_img(raw)
    raw.gsub(/<img.*\/>/, '')
  end

end