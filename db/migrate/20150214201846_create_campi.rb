class CreateCampi < ActiveRecord::Migration
  def change
    create_table :campi do |t|
      t.string :nome
      t.string :sigla

      t.timestamps null: false
    end
  end

  add_reference :usuarios, :campus, index: true
end
