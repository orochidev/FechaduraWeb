class Sala < ApplicationRecord
    validates_presence_of :codigo, message: "Por favor, preencha o nome/identificador da sala!"

    validates_uniqueness_of :codigo, message: "Este nome/identificador já pertence a outra sala!"
    has_many :horarios, :autosave =>true
    has_many :entradas




    def to_s
      codigo
    end

    def tem_professor?

    end

    def count_alunos_dentro

    end
end
