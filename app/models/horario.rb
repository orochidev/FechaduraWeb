class Horario < ApplicationRecord
  belongs_to :sala
  has_many :horario_itens,  -> { order 'dia asc' }, :autosave => true
  validates_presence_of :tipo_permitido, :message => "Você precisa informar o tipo de pessoa permitido"
  accepts_nested_attributes_for :horario_itens

  def horario_inicio(dia=nil)
		if dia
			t = horario_itens.where(:dia => dia).first
			t.horario_inicio.strftime("%H:%M").to_time
		else
			t = horario_itens.where(:dia => Time.now.wday).first
			t.horario_inicio.strftime("%H:%M").to_time
		end
	end

	def horario_fim(dia=nil)
		if dia
			t = horario_itens.where(:dia => dia).first
			t.horario_fim.strftime("%H:%M").to_time
		else
			t = horario_itens.where(:dia => Time.now.wday).first
			t.horario_fim.strftime("%H:%M").to_time
		end
	end
end
