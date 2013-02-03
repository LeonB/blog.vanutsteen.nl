module Breadcrumbs
  class << self
    def registered(app)
			app.helpers Helpers
    end
    alias :included :registered
  end

  module Helpers
    def breadcrumbs()
      @breadcrumbs ||= []
    end
  end

end

::Middleman::Extensions.register(:breadcrumbs, Breadcrumbs) 