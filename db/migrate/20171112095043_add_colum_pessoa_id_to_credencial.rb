class AddColumPessoaIdToCredencial < ActiveRecord::Migration[5.1]
  def change
    add_column :credenciais, :pessoa_id, :integer
  end
end
