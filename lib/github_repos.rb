require 'net/http'
require 'uri'

module GithubRepos
  class << self
    def registered(app)
      app.send :include, Helpers
    end
    alias :included :registered
  end

  module Helpers
    class << self
      @@github_repos = nil
    end

    def github_repos
      return @@github_repos if @@github_repos

      uri = URI.parse("https://api.github.com/users/#{github_username}/repos")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      content = http.get(uri.request_uri).body
      repos = ActiveSupport::JSON.decode(content)

      # if repos['message']
      #   raise repos['message']
      # end

      repos.sort_by! { |repo| repo['watchers_count'] }.reverse!

      @@github_repos = []
      i = 0
      repos.each do |repo|
        if repo['fork'] and github_skip_forks
          next
        end

        @@github_repos << repo

        if i > github_repo_count
          break
        end

        i = i + 1

      end
      return @@github_repos
    end
  end
end

::Middleman::Extensions.register(:github_repos, GithubRepos) 