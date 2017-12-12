class RA < Credencial
  validates_uniqueness_of :codigo, message: "Outra pessoa já está cadastrada com este RA"
  validates_presence_of :codigo, message: "Você precisa informar o RA"

end
