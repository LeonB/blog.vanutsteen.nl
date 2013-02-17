# require "html_truncator"

module HtmlFilters
  class << self
    def registered(app)
      app.helpers Helpers
    end
    alias :included :registered
  end

  module Helpers
  def strip_img(raw)
    raw.gsub(/<img.*\/>/, '')
  end
  end

end

::Middleman::Extensions.register(:html_filters, HtmlFilters)
