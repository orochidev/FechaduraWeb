class Credencial < ApplicationRecord
  belongs_to :pessoa, autosave: true, validate: false
  def self.search(search)
    where("codigo = ?", search)
  end
  def to_s
    self.codigo
  end
end
