class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.string :image_id
      t.string :introductin
      t.integer :price
      t.boolean :is_active, default: true, null: false

      t.timestamps
    end
  end
end
