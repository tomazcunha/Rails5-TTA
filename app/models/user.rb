class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associação
  has_one :user_profile   # Usuário vai ter apenas 'um' perfil

  # Atributos de outra tabela
  accepts_nested_attributes_for :user_profile, reject_if: :all_blank #, allow_destroy: true
    # reject_if     = Regeitar se estiver em branco
    # allow_destroy = permitir apagar (nesse caso, não)

  # Validations
  # presence:   = preenchimento obrigatório do campo
  # length:     = quantidade de caracters
  # on: :update = fazer validação só quando for update
  # unless      = para verificar se está vindo do resete de senha, se for true, não valida first_name.
  validates :first_name, presence: true, length: { minimum: 3 }, on: :update, unless: :reset_password_token_present?


  # Callback
  after_create :set_statistic

  # Virtual Attributes
  def full_name
    # "#{self.first_name} #{self.last_name}"
    # [self.first_name, self.last_name].join('---') #
    [self.first_name, self.last_name].join(' ') # juntando os valores do array
  end

  private

  # Callback para somar total na criação de usuário
  def set_statistic
    AdminStatistic.set_total_event(AdminStatistic::EVENTS[:total_users])
  end

  def reset_password_token_present?
    # !!params[:user][:reset_password_token]
    !!$global_params[:user][:reset_password_token]
  end
  # com "!!", se não estiver não estiver presente, em vez de 'nil' ele vai retornar 'false'
  # Se estiver presente, no final volta a ser true.
  # O problema é que a variável 'params' só visível nas views w nos controles.
  # Precisamos criar uma variável global '$nome_da_variável'

end
