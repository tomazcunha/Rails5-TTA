class Question < ApplicationRecord
  # belongs_to :subject   # com belongs_to, quando cadastrar Question, é obrigatório informar o assunto.
  # belongs_to :subject, optional: true         # permitiria cadastrar question sem subject
  belongs_to :subject, inverse_of: :questions   # evitar erro na hora do cadastro, precisa ter has_many no outro lado.

  has_many :answers     # plural

  # question deve aceitar atributos das respostas
  # accepts_nested_attributes_for :answers

  # cocoon
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
    # reject_if: :all_blank   =>  Só salva os preenchidos (conf. do accepts_nested_attributes_for)
    # allow_destroy: true     =>  Para permitir o botão de Apagar

  paginates_per 5   # kaminari


  # Criando um método de classe para ser chamada no controle 'search' sem precisar instanciar
  # Agora esta pesquisa fica disponívem para qualquer outro controller, só passar os parâmetros.
  # Trazendo a lógica para o Model.
  # def self.search(term, page)
  #   # Question.includes(:answers)
  #   #   .where("lower(description) LIKE ?", "%#{term.downcase}%")
  #   #   .page(page)
  #
  #   # Não precisa incluir a classe 'Question', ela que está invocando o 'search' então ela já vem referenciada pelo 'self'.
  #   includes(:answers)
  #     .where("lower(description) LIKE ?", "%#{term.downcase}%")
  #     .page(page)
  # end

  scope :scope_search, -> (term, page){
    includes(:answers)
      .where("lower(description) LIKE ?", "%#{term.downcase}%")
      .page(page)
  }

  # def self.last_questions(page)
  #   # Question.includes(:answers).order('created_at desc').page(page)
  #
  #   # Question = self
  #   includes(:answers).order('created_at desc').page(page)
  # end

  scope :scope_last_questions, -> (page){
    includes(:answers).order('created_at desc').page(page)
  }

end
