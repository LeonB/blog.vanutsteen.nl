# encoding: utf-8
#
# Octopress tag cloud generator
#
# Version: 0.3
#
# Copyright (c) 2012 Robby Edwards, http://robbyedwards.com/
# Licensed under the MIT license (http://www.opensource.org/licenses/mit-license.php)
#
# Octopress plugin to display tag clouds.
# Based on https://gist.github.com/1577100 by @tokkonopapa
#
# Defines a 'tag_cloud' tag that is rendered by Liquid into a tag cloud:
#
#     <div class='cloud'>
#         {% tag_cloud %}
#     </div>
#
# See README for installation and usage instructions.

module Jekyll

  class TagCloud < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      @opts = {}
      if markup.strip =~ /\s*counter:(\w+)/i
        @opts['counter'] = ($1 == 'true')
        markup = markup.strip.sub(/counter:\w+/i,'')
      end
      super
    end

    def render(context)
      lists = {}
      max, min = 1, 1
      config = context.registers[:site].config
      category_dir = config['root'] + config['category_dir'] + '/'
      categories = context.registers[:site].categories
      categories.keys.sort_by{ |str| str.downcase }.each do |category|
        count = categories[category].count
        lists[category] = count
        max = count if count > max
      end

      html = ''
      lists.each do | category, counter |
        url = category_dir + category.gsub(/_|\P{Word}/, '-').gsub(/-{2,}/, '-').downcase
        style = "font-size: #{100 + (60 * Float(counter)/max)}%"
        html << "<a href='#{url}' style='#{style}'>#{category}"
        if @opts['counter']
          html << "(#{categories[category].count})"
        end
        html << "</a> "
      end
      html
    end
  end

end

Liquid::Template.register_tag('tag_cloud', Jekyll::TagCloud)
