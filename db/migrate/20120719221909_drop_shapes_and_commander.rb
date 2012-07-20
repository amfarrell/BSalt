class DropShapesAndCommander < ActiveRecord::Migration
  def self.up
    remove_column :platoons, :commander_id
    drop_table :edges
    drop_table :squares
    drop_table :triangles
    drop_table :circles
 end

  def self.down
    add_column :platoons, :commander_id
  end
end
