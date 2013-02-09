require 'net/http'
require 'uri'

module CoderwallBadges
  class << self
    def registered(app)
      app.send :include, Helpers
    end
    alias :included :registered
  end

  class Achievement
    attr_reader :name, :badge, :description, :created

    def initialize(hashed_badge)
      @name, @description, @created, @badge = hashed_badge.values
    end
  end

  module Helpers
    class << self
      @@coderwall_badges = nil
    end

    def coderwall_badges
      return @@coderwall_badges if @@coderwall_badges

      raise(ArgumentError, "Invalid username") if coderwall_username.empty?
      url = URI.escape("https://coderwall.com/#{coderwall_username}.json")
      begin
        response = JSON.load(open(url))
      rescue OpenURI::HTTPError
        raise(ArgumentError, "Invalid username")
      end

      @@coderwall_badges = response["badges"].map { |badge| Achievement.new(badge) }
    end
  end
end

::Middleman::Extensions.register(:coderwall_badges, CoderwallBadges) 