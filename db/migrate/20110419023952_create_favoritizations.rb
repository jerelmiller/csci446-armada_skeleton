class CreateFavoritizations < ActiveRecord::Migration
  def self.up
    create_table :favoritizations do |t|
      t.integer :user_id
      t.integer :gnome_id
      t.datetime :created_at

      t.timestamps
    end
  end

  def self.down
    drop_table :favoritizations
  end
end
