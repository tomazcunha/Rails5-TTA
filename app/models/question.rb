class Question < ApplicationRecord
  # belongs_to :subject   # com belongs_to, quando cadastrar Question, é obrigatório informar o assunto.
  # belongs_to :subject, optional: true         # permitiria cadastrar question sem subject
  belongs_to :subject, inverse_of: :question    # evitar erro na hora do cadastro, precisa ter has_many no outro lado.

  has_many :answers     # plural

  # question deve aceitar atributos das respostas
  # accepts_nested_attributes_for :answers

  # cocoon
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
    # reject_if: :all_blank   =>  Só salva os preenchidos (conf. do accepts_nested_attributes_for)
    # allow_destroy: true     =>  Para permitir o botão de Apagar

end
