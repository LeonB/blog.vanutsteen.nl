require "nokogiri"

module HtmlFilters
  class << self
    def registered(app)
      app.helpers Helpers
    end
    alias :included :registered
  end

  module Helpers
  def strip_img(raw)
    f = Nokogiri::HTML.fragment(raw)
    f.at('img').remove if f.at('img')

    f.css('p').each do |node|
     node.remove if node.inner_text == ''
    end

    f.to_html
  end
  end

end

::Middleman::Extensions.register(:html_filters, HtmlFilters)
