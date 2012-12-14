module SimplePages
  module PagesHelper
    def publish_time(published_at, updated_at)
      return unless published_at
      options = {
        datetime: published_at,
        pubdate: true,
        :'data-updated' => (updated_at != published_at ? 'true' : nil ),
        class: 'published_at'
      }
      content_tag :time, ::I18n.l(published_at, format: :long), options
    end

    def author_vcard(author)
      content_tag :span, class: 'author vcard' do
        t('helpers.posted_by', name: content_tag(:span, author)).html_safe
      end
    end

    def selected_page_author(object)
      object.author.try :simple_page_owner_option
    end

    def local_published_at(object)
      object.published_at? ? object.published_at.localtime : nil
    end
  end
end
