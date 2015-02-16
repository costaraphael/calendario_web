class AddRegrasToEventoTipo < ActiveRecord::Migration
  def change
    add_column :evento_tipos, :tem_dia_semana, :boolean
    add_column :evento_tipos, :tem_descricao, :boolean
    add_column :evento_tipos, :tem_periodo, :boolean
  end
end
