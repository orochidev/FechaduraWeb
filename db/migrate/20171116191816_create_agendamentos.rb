class CreateAgendamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :agendamentos do |t|
      t.time :horario_inicio
      t.time :horario_fim
      t.integer :dia
      t.string :tipo_permitido

      t.timestamps
    end
  end
end
