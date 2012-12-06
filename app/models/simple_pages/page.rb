module SimplePages
  class Page < ActiveRecord::Base
    self.table_name = SimplePages.page_table_name

    attr_reader :owner

    attr_accessible :title, :excerpt, :content, :published_at, :owner, :layout_at

    validates :url, presence: true
    validates :title, presence: true

    belongs_to :author, polymorphic: true

    has_many :attachments, as: :resource

    acts_as_url :title

    scope :published, lambda { where('published_at <= ?', Time.zone.now) }

    class << self
      def find_or_create_by_url(attrs)
        url = attrs.delete(:url)
        page = find_by_url(url)
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

    def owner=(attrs)
      owner_attrs = attrs.split(',')
      self.author_type = owner_attrs.first
      self.author_id = owner_attrs.last
    end

    SimplePages.page_modules.each do |module_name|
      include module_name
    end
  end
end
