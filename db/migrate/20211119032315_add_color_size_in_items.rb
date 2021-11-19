class AddColorSizeInItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :colors, :text, array: true, default: []
    add_column :items, :sizes, :text, array: true, default: []
  end
end
