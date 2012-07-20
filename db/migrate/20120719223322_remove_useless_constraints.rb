class RemoveUselessConstraints < ActiveRecord::Migration
  def self.up
    change_column :cadets, :birthdatetime, :datetime, :null => true
    change_column :cadets, :birthlocation, :text, :null => true
    change_column :cadets, :height, :integer, :null => true
    change_column :cadets, :weight, :integer, :null => true
  end

  def self.down
    change_column :cadets, :birthdatetime, :datetime, :null => false
    change_column :cadets, :birthlocation, :text, :null => false
    change_column :cadets, :height, :integer, :null => false
    change_column :cadets, :weight, :integer, :null => false
  end
end
