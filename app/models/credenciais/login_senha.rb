class LoginSenha < Credencial
  has_secure_password
  validates :password, presence: true, length: {minimum: 4}
  validates_presence_of :login
  validates_uniqueness_of :login, message: "Este login já está sendo utilizado por outra pessoa"
end
