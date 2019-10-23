class Question < ApplicationRecord
  belongs_to :subject
  has_many :answers   # plural

  accepts_nested_attributes_for :answers
  # question deve aceitar atributos das respostas
end
