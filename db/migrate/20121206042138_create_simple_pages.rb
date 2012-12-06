class CreateSimplePages < ActiveRecord::Migration
  def change
    create_table :simple_pages do |t|
      t.string :url
      t.string :title
      t.string :excerpt
      t.text :content
      t.belongs_to :author, polymorphic: true
      t.string :layout_at
      t.datetime :published_at

      t.timestamps
    end
    add_index :simple_pages, [:author_id, :author_type], name: 'author'
    add_index :simple_pages, :layout_at
    add_index :simple_pages, :published_at
  end
end
