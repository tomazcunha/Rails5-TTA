class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def full_name
    # "#{self.first_name} #{self.last_name}"
    # [self.first_name, self.last_name].join('---') #
    [self.first_name, self.last_name].join(' ') # juntando os valores do array
  end
end
