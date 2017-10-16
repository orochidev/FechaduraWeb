class CreateCredenciais < ActiveRecord::Migration[5.1]
  def change
    create_table :credenciais do |t|
      t.string :type
      t.string :codigo

      t.timestamps
    end
  end
end
