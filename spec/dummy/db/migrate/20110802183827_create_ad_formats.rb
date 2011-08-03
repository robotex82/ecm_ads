class CreateAdFormats < ActiveRecord::Migration
  def self.up
    create_table :ad_formats do |t|
      t.string :name
      t.string :width
      t.string :height

      t.timestamps
    end
  end

  def self.down
    drop_table :ad_formats
  end
end
