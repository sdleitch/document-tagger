class AddColumnTaggedToDocs < ActiveRecord::Migration
  def self.up
    add_column :documents, :times_tagged, :integer, default: 0
  end

  def self.down
    remove_column :documents, :times_tagged
  end
end
