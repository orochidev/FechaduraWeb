class CreatePessoas < ActiveRecord::Migration[5.1]
  def change
    create_table :pessoas do |t|
      t.string :type
      t.string :nome
      t.string :telefone
      t.string :email
      t.string :nick

      t.timestamps
    end
  end
end
