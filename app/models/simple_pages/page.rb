module SimplePages
  class Page < ActiveRecord::Base
    self.table_name = SimplePages.page_table_name

    attr_accessible :title, :excerpt, :content, :published_at, :layout_at

    validates :title, presence: true

    scope :published, lambda { where('published_at <= ?', Time.zone.now) }
    scope :layout_at, lambda { |location| where(layout_at: location) }

    def layout_at=(values)
      if values.blank?
        super nil
      else
        super values
      end
    end

    SimplePages.page_modules.each { |module_name| include module_name }
  end
end
