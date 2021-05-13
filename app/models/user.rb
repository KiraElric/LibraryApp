class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :first_name, :last_name, :rut, presence: true

  enum city: %i[ santiago concepcion chillan valparaiso arica iquique antofagasta aysen ]
  enum country: %i[ chile argentina vanezuela ecuador uruguay colombia ]
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
