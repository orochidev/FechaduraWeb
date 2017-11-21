class HorarioItem < ApplicationRecord
  belongs_to :horario, autosave: true
  validates_presence_of :horario_inicio, :message => "Informe o horário de inicio"
  validates_presence_of :horario_fim, :message => "Informe o horário de término"

end
