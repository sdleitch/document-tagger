class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.text :body
      t.integer :interesting
      t.integer :funny
      t.integer :boring
      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
