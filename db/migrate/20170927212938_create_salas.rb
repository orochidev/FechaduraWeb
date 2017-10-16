class CreateSalas < ActiveRecord::Migration[5.1]
  def change
    create_table :salas do |t|
      t.string :codigo

      t.timestamps
    end
  end
end
