class CreateRecords < ActiveRecord::Migration
  def self.up
    create_table :records do |t|
      t.string :information
      t.string :table_id
      t.timestamps
    end
  end

  def self.down
    drop_table :records
  end
end
