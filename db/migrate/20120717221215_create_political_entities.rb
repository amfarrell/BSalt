class CreatePoliticalEntities < ActiveRecord::Migration
  def self.up
    create_table :feelings do |t|
      t.references :feelable, :polymorphic => true
      t.integer :from_id :null => false
      t.string :from_id_type
      t.integer :at_id :null => false
      t.string :at_id_type
      t.integer :intensity  :null => false #-100 to 100
      t.text :history #possible history explaining loyalty
      t.timestamps
    end

    create_table :political_entities do |t|
      t.text :name
      t.text :country_code 
      t.text :description
      t.boolean :IF_member?
      t.timestamps
    end


  end

  def self.down
    drop_table :political_entities
    drop_table :feelings
  end
end
