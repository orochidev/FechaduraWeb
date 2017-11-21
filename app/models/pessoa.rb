class Pessoa < ApplicationRecord
  validates_presence_of :nome, message: "O nome precisa ser preenchido"
  validates_presence_of :email, message: "O email precisa ser preenchido"
  validates_length_of :email, maximum: 260, message: "O e-mail informado é grande demais"
  validates :email, uniqueness:{message:"Este e-mail está sendo usado por outra pessoa", case_sensitive:false }
  VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_format_of :email, with: VALID_EMAIL_FORMAT, message: "O e-mail está em um formato inválido"
  before_save { self.email = email.downcase }

  has_many :credenciais, autosave: true

  accepts_nested_attributes_for :credenciais


  def self.all_subclasses
    ['Administrador', 'Aluno', 'Professor', 'Servidor']
  end

  def to_s
    self.nome
  end




end
