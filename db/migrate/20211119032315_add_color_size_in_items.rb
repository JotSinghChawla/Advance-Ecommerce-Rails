class AddColorSizeInItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :colors, :text
    add_column :items, :sizes, :text
  end
end
