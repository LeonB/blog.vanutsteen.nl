require 'rmagick'
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
    attr_reader :name, :url, :description, :created
    attr_accessor :filename

    def initialize(hashed_badge)
      @name, @description, @created, @url = hashed_badge.values
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

      @@coderwall_badges = response["user"]["badges"].map { |badge| Achievement.new(badge) }

      @@coderwall_badges.each do |badge|
        badge.filename = badge.name.gsub(/\s/, '-')
      end

      if coderwall_images_directory
        path = 'source/' + coderwall_images_directory.gsub(/source\/?/, '')
        user_agent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.22 (KHTML, like Gecko) Ubuntu Chromium/25.0.1364.160 Chrome/25.0.1364.160 Safari/537.22'

        @@coderwall_badges.each do |badge|
          uri = URI.parse(badge.url)
          extension =  File.extname(badge.url)
          full_path = "#{path}/#{badge.filename}#{extension}"

          if File.exist?(full_path)
            next
          end

          Net::HTTP.start(uri.host) do |http|
            response = http.get(uri.request_uri, {'User-Agent' => user_agent})

            if response.code != '200'
              next
            end

            image = Magick::Image.from_blob(response.body).first
            image.change_geometry!("42x42") { |cols, rows, img|
                newimg = img.resize(cols, rows)
                newimg.write(full_path)
            }
          end


        end #coderwall.badges.each
      end
    end
  end
end

::Middleman::Extensions.register(:coderwall_badges, CoderwallBadges) 
