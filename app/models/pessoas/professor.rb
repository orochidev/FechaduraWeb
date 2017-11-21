class Professor < Pessoa
  validates_presence_of :telefone, message: "Um telefone de contato precisa ser informado!"

end
