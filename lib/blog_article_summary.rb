module BlogArticleSummary
  class << self
    def registered(app)
      app.after_configuration do
        ::Middleman::Blog::BlogArticle.send :define_method, 'summary' do
          @_summary ||= begin
            source = @app.template_data_for_file(source_file).dup

            summary_source = if @app.blog.options.summary_generator
                               @app.blog.options.summary_generator.call(self, source)
                             else
                               default_summary_generator(source)
                             end

            summary_source
          end
        end
      end
    end
    alias :included :registered
  end
end

::Middleman::Extensions.register(:blog_article_summary, BlogArticleSummary) 