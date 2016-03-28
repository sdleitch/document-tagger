class RemoveColumnsAndAddFromTags < ActiveRecord::Migration
  # Removes previous 3 columns (intersting, funny, boring)
  # and sets the tags to symbols defined in TAGS from app.rb
  require './app'

  def change
    remove_column(:documents, :interesting)
    remove_column(:documents, :funny)
    remove_column(:documents, :boring)
    TAGS.each do |tag|
      add_column(:documents, tag, :integer, default: 0)
    end
  end
end
