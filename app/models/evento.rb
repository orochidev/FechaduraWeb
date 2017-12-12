class Evento < ApplicationRecord
  belongs_to :pessoa
  belongs_to :sala
end
