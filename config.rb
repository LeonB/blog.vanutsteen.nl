require "lib/blog_categories"
require "lib/coderwall_badges"
require "lib/uuid"
require "lib/html_filters"
require "lib/breadcrumbs"
require "lib/github_repos"
require 'middleman-blog/truncate_html'

# linkchecker "http://v5.vanutsteen.nl" --no-warnings

###
# Blog settings
###

# Time.zone = "Europe/Amsterdam"

activate :dotenv

activate :blog do |blog|
  # blog.prefix = "posts"
  blog.permalink = ":year/:month/:day/:title.html"
  blog.sources = "posts/:year-:month-:day-:title.html"
  blog.layout = "blaat" #set is to something non-existing so I am forced to fill it in
  blog.paginate = true #enable pagination
  blog.per_page = 10
  blog.page_link = "page/:num"

  blog.summary_generator = lambda do |resource, rendered, length, ellipsis|
    if resource.data['summary']
      resource.data['summary']
    else
      TruncateHTML.truncate_html(strip_img(rendered), length, ellipsis)
    end
  end
end

activate :blog_categories do |categories|
  categories.category_template = "category.html"
  categories.categorylink = "categories/:category.html"
end

activate :backtick_code_block
activate :breadcrumbs
activate :coderwall_badges
activate :directory_indexes
activate :github_repos
activate :html_filters
# activate :livereload

# Doesn't work for now because of https://github.com/middleman/middleman-minify-html/issues/6
activate :minify_html,
  :remove_input_attributes => false

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
set :url, ENV['URL']
set :title, ENV['TITLE']
set :subtitle, ENV['SUBTITLE']
set :description, ENV['DESCRIPTION']
set :author, ENV['AUTHOR']
set :email, ENV['EMAIL']
set :disqus_short_name, ENV['DISQUS_SHORT_NAME']
set :github_username, ENV['GITHUB_USERNAME']
set :github_repo_count, 5
set :github_skip_forks, true
set :coderwall_username, ENV['CODERWALL_USERNAME']
set :coderwall_images_directory, 'images/coderwall'
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
  # activate :smusher
  # use trimage instead!

  # Or use a different image path
  # set :http_path, "http://cdn.blog.vanutsteen.nl/"

  # set :http_prefix, "http://cdn.blog.vanutsteen.nl/"

  activate :asset_host
  set :asset_host, "//cdn.blog.vanutsteen.nl"

  # change asset filename with every update
  activate :asset_hash

  # pre-gzip files
  activate :gzip, :exts => %w(.js .css .html .htm .json .rss .xml)

  # Compress images
  # Use `image_optim --no-threads -r source/images` instead!
  # activate :image_optim do |image_optim|
    # # print out skipped images
    # image_optim.verbose = true

    # # Download pngout from http://www.jonof.id.au/pngout
    # # apt-get install gifsicle
  # end
end

activate :deploy do |deploy|
  deploy.method = :rsync
  deploy.user = ENV['DEPLOY_USER']
  deploy.host = ENV['DEPLOY_HOST']
  deploy.path = ENV['DEPLOY_PATH']
  deploy.clean = true
  deploy.build_before = false
end

activate :swiftype do |swiftype|
  swiftype.api_key = ENV['SWIFTYPE_API_KEY']
  swiftype.engine_slug = ENV['SWIFTYPE_ENGINE_SLUG']
  swiftype.pages_selector = lambda { |p| p.path.match(/\.html/) && (p.metadata[:options][:layout] == 'post' || p.metadata[:options][:layout] == 'static') }
  swiftype.process_html = lambda { |f| f.search('.//div[@class="linenodiv"]').remove }
  swiftype.generate_sections = lambda { |p| (p.metadata[:page]['tags'] ||= []) + (p.metadata[:page]['categories'] ||= []) }
  swiftype.generate_info = lambda { |f| TruncateHTML.truncate_html(strip_img(f.to_s), blog.options.summary_length, '...') }
  swiftype.generate_image = lambda { |p| "#{settings.url}#{p.metadata[:page]['banner']}" if p.metadata[:page]['banner'] }
end

# Create an RFC4122 UUID http://www.ietf.org/rfc/rfc4122.txt
set :uuid, UUID.create_sha1(self.url, UUID::NameSpace_URL)

# Assemble resources to generate archive pages, Atom & JSON feeds
ready do
  # http://darrenknewton.com/2012/09/16/hacking-up-sites-with-middleman.html

  blog.articles.each do |a|
    proxy "#{a.url}atom.xml", "/atom.xml", :layout => false, :locals => { :articles => [a] }
    proxy "#{a.url}atom.json", "/atom.json", :layout => false, :locals => { :articles => [a] }
  end

  page "/atom.xml", :layout => false do
    @articles = blog.articles
  end

  page "/atom.json", :layout => false do
    @articles = blog.articles
  end

  page "/feed.rss", :layout => false

  page "/google*.html", :directory_index => false
  page "/pinterest*.html", :directory_index => false
  # page "/404.html", :directory_index => false

  ignore "/javascripts/vendor/*"
  ignore "/stylesheets/jquery.fancybox.css"
  ignore "/stylesheets/_github.css.scss"
  ignore "/images/coderwall/*" # only used for sprites

  # page "/about.html" do
  #   current_page.extend ::Middleman::Blog::BlogArticle
  # end
end

# Syntax highlighting based on Pygments
activate :syntax, :line_numbers => true

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true,
               :table => true,
               :autolink => true,
               :smartypants => true


