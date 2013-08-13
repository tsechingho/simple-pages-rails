class AddClusterToSimplePages < ActiveRecord::Migration
  def change
    add_column :simple_pages, :cluster, :string, after: :layout_at
  end
end
