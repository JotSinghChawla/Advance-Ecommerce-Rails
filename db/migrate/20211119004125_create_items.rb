class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :category
      t.integer :price
      t.decimal :reviews

      t.timestamps
    end
  end
end
