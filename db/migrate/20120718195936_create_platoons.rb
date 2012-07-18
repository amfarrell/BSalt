class CreatePlatoons < ActiveRecord::Migration
  def self.up
    create_table :platoons do |t|
      t.text :name, :null => false
      t.text :major_color, :null => false
      t.text :minor_color
      t.text :barracks, :null => false
      t.integer :commander_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :platoons
  end
end
