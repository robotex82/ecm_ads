class CreateAds < ActiveRecord::Migration
  def self.up
    create_table :ads do |t|
      t.string :position
      t.string :banner_image_file_name
      t.string :banner_image_content_type
      t.integer :banner_image_file_size
      t.datetime :banner_image_updated_at
      t.datetime :last_impression
      t.integer :impressions, :default => 0
      t.integer :clicks, :default => 0
      t.string :link

      t.timestamps
    end
  end

  def self.down
    drop_table :ads
  end
end
