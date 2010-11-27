class CreateRooms < ActiveRecord::Migration
  def self.up
    create_table :rooms do |t|
      t.string :key
      t.text :description
    end
  end

  def self.down
    drop_table :rooms
  end
end
