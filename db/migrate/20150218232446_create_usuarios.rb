class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :login
      t.string :senha
      t.string :salt
      t.boolean :ativo
      t.references :campus, index: true

      t.timestamps null: false
    end
    add_foreign_key :usuarios, :campi
  end
end
