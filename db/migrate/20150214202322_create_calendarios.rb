class CreateCalendarios < ActiveRecord::Migration
  def change
    create_table :calendarios do |t|
      t.references :campus, index: true
      t.string :nome
      t.datetime :vigencia

      t.timestamps null: false
    end
    add_foreign_key :calendarios, :campi
  end
end
