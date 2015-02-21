class AddDeletedAtToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :deleted_at, :datetime
    add_index :eventos, :deleted_at
  end
end
