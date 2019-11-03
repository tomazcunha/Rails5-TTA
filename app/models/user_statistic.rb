class UserStatistic < ApplicationRecord
  belongs_to :user

  # Virtual Attributes
  def total_questions
    self.right_questions + self.wrong_questions
  end


  # Class Method (self)
  def self.set_statistic(answer, current_user)
    if !!current_user
      user_statistic = UserStatistic.find_or_create_by(user: current_user)
      answer.correct? ? user_statistic.right_questions += 1 : user_statistic.wrong_questions += 1
      user_statistic.save
    end
      # Verifica se está logado
      # Procura se existir o usuário atual na tabela. Se não existir, cria.
      # Se a resposta estiver correta ou não, soma um dos campos.
      # salva

  end
end
