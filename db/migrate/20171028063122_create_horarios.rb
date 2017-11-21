class CreateHorarios < ActiveRecord::Migration[5.1]
  def change
    create_table :horarios do |t|
      t.string :tipo_permitido
      t.integer :sala_id

      t.timestamps
    end
  end
end
