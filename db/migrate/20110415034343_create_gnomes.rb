class CreateGnomes < ActiveRecord::Migration
  def self.up
    create_table :gnomes do |t|
      t.string :name
      t.integer :cost
      t.integer :age
      t.string :gender
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end

  def self.down
    drop_table :gnomes
  end
end
