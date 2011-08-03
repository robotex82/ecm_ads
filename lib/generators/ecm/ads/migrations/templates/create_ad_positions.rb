class CreateAdPositions < ActiveRecord::Migration
  def self.up
    create_table :ad_positions do |t|
      t.string :name
      t.text :description
      #t.text :css_classes
      #t.text :css_ids

      t.timestamps
    end
  end

  def self.down
    drop_table :ad_positions
  end
end
