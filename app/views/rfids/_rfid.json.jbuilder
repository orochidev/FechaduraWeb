json.extract! rfid, :id, :codigo, :created_at, :updated_at

json.pessoa rfid.pessoa, partial: 'pessoas/pessoa', as: :pessoa
