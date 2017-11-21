class CreateEventos < ActiveRecord::Migration[5.1]
  def change
    create_table :eventos do |t|
      t.integer :pessoa_id
      t.integer :sala_id
      t.string :type

      t.timestamps
    end
  end
end
