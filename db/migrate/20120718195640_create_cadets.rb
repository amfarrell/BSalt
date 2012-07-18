class CreateCadets < ActiveRecord::Migration
  def self.up
    create_table :cadets do |t|
      t.integer :platoon_id, :null => false
      t.integer :superior_id, :null => false
      t.text :rank, :null => false
      t.text :name, :null => false
      t.string :student_id_number, :null => false
      t.text :bunk, :null => false
      t.datetime :birthdatetime, :null => false
      t.text :birthlocation, :null => false
      t.integer :height, :null => false
      t.integer :weight, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :cadets
  end
end
