module SimplePages
  class Page < ActiveRecord::Base
    self.table_name = SimplePages.page_table_name

    attr_accessible :title, :excerpt, :content, :published_at, :layout_at

    validates :url, presence: true
    validates :title, presence: true

    acts_as_url :title

    scope :published, lambda { where('published_at <= ?', Time.zone.now) }
    scope :layout_at, lambda { |location| where(layout_at: location) }

    class << self
      def find_or_create_by_url(attrs)
        url = attrs.delete :url
        page = where(url: url).first
        if page.nil?
          page = create(attrs)
          page.url = url
          page.save
        end
        page
      end
    end

    def to_param
      url
    end

    SimplePages.page_modules.each { |module_name| include module_name }
  end
end
