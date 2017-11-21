class AddColumnsLoginSenhaToCredencial < ActiveRecord::Migration[5.1]
  def change
    add_column :credenciais, :login, :string
    add_column :credenciais, :password_digest, :string
  end
end
