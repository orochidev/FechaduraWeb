class CreateCalouros < ActiveRecord::Migration[5.1]
  def change
    create_table :calouros do |t|
      t.string :nome
      t.integer :idade

      t.timestamps
    end
  end
end
