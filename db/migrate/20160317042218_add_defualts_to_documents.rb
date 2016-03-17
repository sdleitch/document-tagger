class AddDefualtsToDocuments < ActiveRecord::Migration
  def change
    change_column_default(:documents, :interesting, 0)
    change_column_default(:documents, :funny, 0)
    change_column_default(:documents, :boring, 0)
  end
end
