class AddAttachmentsPhotoToGnome < ActiveRecord::Migration
  def self.up
    add_column :gnomes, :photo_file_name, :string
    add_column :gnomes, :photo_content_type, :string
    add_column :gnomes, :photo_file_size, :integer
    add_column :gnomes, :photo_updated_at, :datetime
  end

  def self.down
    remove_column :gnomes, :photo_file_name
    remove_column :gnomes, :photo_content_type
    remove_column :gnomes, :photo_file_size
    remove_column :gnomes, :photo_updated_at
  end
end
