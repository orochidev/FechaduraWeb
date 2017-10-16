class Pessoa < ApplicationRecord
  validates_presence_of :nome
  validates_presence_of :email

end
