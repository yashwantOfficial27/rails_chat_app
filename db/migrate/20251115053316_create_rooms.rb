class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :slug
      t.text :description

      t.timestamps
    end
    add_index :rooms, :slug, unique: true
  end
end
