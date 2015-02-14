class CreateEventoTipos < ActiveRecord::Migration
  def change
    create_table :evento_tipos do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
