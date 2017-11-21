class AddColumnDescricaoToSala < ActiveRecord::Migration[5.1]
  def change
    add_column :salas, :descricao, :string
  end
end
