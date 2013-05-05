# A sitemap plugin that adds category pages to the sitemap
# based on the categorys of blog articles.
module BlogCategories
	class Options
    KEYS = [
            :categorylink,
            :category_template,
           ]

    KEYS.each do |name|
      attr_accessor name
    end

    def initialize(options={})
      options.each do |k,v|
        self.send(:"#{k}=", v)
      end
    end
  end

  class << self
    def registered(app, options_hash={}, &block)
    	app.helpers Helpers

      options = Options.new(options_hash)
      yield options if block_given?

      options.categorylink ||= "categories/:category.html"

      # If "prefix" option is specified, all other paths are relative to it.
      # if options.prefix
      #   options.prefix = "/#{options.prefix}" unless options.prefix.start_with? '/'
      #   options.categorylink = File.join(options.prefix, options.categorylink)
      # end

      app.after_configuration do
      	category_pages(options)

      	if options.category_template
          ignore options.category_template

	        sitemap.register_resource_list_manipulator(
	                                                   :blog_categories,
	                                                   CategoryPages.new(self),
	                                                   false
	                                                   )
	      end
      end
    end

    alias :included :registered
  end

	module Helpers
    def category_pages(options=nil)
      @_category_pages ||= options
    end

	  def category_path(category)
	    sitemap.find_resource_by_path(CategoryPages.link(self, category)).try(:url)
	  end
	end

	class CategoryPages
    def initialize(app)
      @app = app
    end

    def manipulate_resource_list(resources)
      resources + @app.blog.categories.map do |category, articles|
        path = CategoryPages.link(@app, category)

        p = ::Middleman::Sitemap::Resource.new(
          @app.sitemap,
          path,
          # @app.category_pages.category_template
        )
        p.proxy_to(@app.category_pages.category_template)

        # Add metadata in local variables so it's accessible to
        # later extensions
        p.add_metadata :locals => {
          'page_type' => 'category',
          'categoryname' => category,
          'articles' => articles
        }
        # Add metadata in instance variables for backwards compatibility
        p.add_metadata do
          @category = category
          @articles = articles
        end
        p
      end
    end

    def self.link(app, category)
      ::Middleman::Util.normalize_path(
        app.category_pages.categorylink.sub(':category', category.parameterize))
    end

	end
end

module Middleman
  module Blog
    module BlogArticle
      # A list of categories for this article, set from frontmatter.
      # @return [Array<String>] (never nil)
      def categories
        article_categories = data["categories"]

        if article_categories.is_a? String
          article_categories.split(',').map(&:strip)
        else
          article_categories || []
        end
      end
    end
  end
end

module Middleman
  module Blog
    class BlogData
      # Returns a map from category name to an array
      # of BlogArticles associated with that category.
      # @return [Hash<String, Array<Middleman::Sitemap::Resource>>]
      def categories
        categories = {}
        @_articles.each do |article|
          article.categories.each do |category|
            categories[category] ||= []
            categories[category] << article
          end
        end

        categories.each do |category, articles|
          categories[category] = articles.sort_by(&:date).reverse
        end

        categories
      end
    end
  end
end


::Middleman::Extensions.register(:blog_categories, BlogCategories)
