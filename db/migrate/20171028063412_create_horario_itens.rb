class CreateHorarioItens < ActiveRecord::Migration[5.1]
  def change
    create_table :horario_itens do |t|
      t.time :horario_inicio
      t.time :horario_fim
      t.integer :dia
      t.integer :horario_id
      t.boolean :valido
      t.boolean :ativo

      t.timestamps
    end
  end
end
