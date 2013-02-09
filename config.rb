require "lib/blog_categories"
require "lib/coderwall_helpers"
require "lib/uuid"
require "lib/html_filters"
require "lib/backtick_code_block"
require "lib/breadcrumbs"
require "lib/github_repos"
#require 'rack/tidy'

#use Rack::Tidy

###
# Blog settings
###

# Time.zone = "Europe/Amsterdam"

activate :blog do |blog|
  # blog.prefix = "posts"
  blog.permalink = ":year/:month/:day/:title.html"
  blog.sources = "posts/:year-:month-:day-:title.html"
   blog.layout = "post"
  blog.paginate = true #enable pagination
  blog.per_page = 10
  blog.page_link = "page/:num"

  blog.summary_generator = lambda{|resource, raw| truncatehtml(strip_img(resource.body), 200) }
end

activate :blog_categories do |categories|
  categories.category_template = "/layouts/category.html.erb"
  categories.categorylink = "categories/:category"
end

activate :livereload
activate :breadcrumbs
activate :directory_indexes
activate :github_repos

###
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :url, 'http://blog.vanutsteen.nl'
set :url, 'http://v5.vanutsteen.nl'
set :title, 'vanutsteen.nl'
set :subtitle, '=> nerds only'
set :description, 'A blog on rails, php, computing, my bass guitar and stuff'
set :author, 'Leon Bogaert'
set :email, 'leon@tim-online.nl'
set :disqus_short_name, 'vanutsteen'
set :github_username, 'LeonB'
set :github_repo_count, 5
set :github_skip_forks, true

set :layout, 'default'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  require "middleman-smusher"
  activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"

  # change asset filename with every update
  activate :asset_hash

  # pre-gzip files
  activate :gzip
end

activate :deploy do |deploy|
  deploy.method = :rsync
  deploy.user = "vanutsteen.nl"
  deploy.host = "blog.vanutsteen.nl"
  deploy.path = "~/domains/v5.vanutsteen.nl/public_html/"
  deploy.clean = true
  deploy.after_build = false
end

# Create an RFC4122 UUID http://www.ietf.org/rfc/rfc4122.txt
set :uuid, UUID.create_sha1(self.url, UUID::NameSpace_URL)

# Assemble resources to generate archive pages, Atom & JSON feeds
ready do
  # http://darrenknewton.com/2012/09/16/hacking-up-sites-with-middleman.html

  blog.articles.each do |a|
    proxy "#{a.url}atom.xml", "/atom.xml", :locals => { :articles => [a] }
    proxy "#{a.url}atom.json", "/atom.json", :locals => { :articles => [a] }
  end

  page "/atom.xml", :layout => false do
    @articles = blog.articles
  end

  page "/atom.json", :layout => false do
    @articles = blog.articles
  end

  page "/feed.rss", :layout => false

  # page "/about.html" do
  #   current_page.extend ::Middleman::Blog::BlogArticle
  # end
end

# Syntax highlighting based on Pygments
activate :syntax, :linenos => 'table', :linenostart => 1, :lexer => 'text'

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true,
               :table => true,
               :autolink => true,
               :smartypants => true

activate :backtick_code_block

helpers HtmlFilters
set :achievements, CoderWallHelpers.achievements_of("leonb")
