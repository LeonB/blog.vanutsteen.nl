# encoding: utf-8
require 'rubygems'

module Liquid
  module StandardFilters

    def strip_img(raw)
    	raw.gsub(/<img.*\/>/, '')
    end
  end
end
