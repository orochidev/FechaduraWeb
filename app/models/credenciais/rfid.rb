class RFID < Credencial
  validates_uniqueness_of :codigo, message: "Este RFID já está sendo utilizado por outra pessoa!"
  validates_presence_of :codigo, message: "Você precisa informar um RFID"

end
