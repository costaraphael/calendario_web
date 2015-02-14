class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.references :calendario, index: true
      t.references :evento_tipo, index: true
      t.date :inicio
      t.date :fim
      t.integer :dia_semana
      t.text :descricao

      t.timestamps null: false
    end
    add_foreign_key :eventos, :calendarios
    add_foreign_key :eventos, :evento_tipos
  end
end
