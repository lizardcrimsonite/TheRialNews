class User < ApplicationRecord
  # Relación con otros modelos
  has_many :posts
  has_many :comments

  # Callback para asignar un rol por defecto antes de la creación
  before_create :set_default_role

  # Roles disponibles
  ROLES = %w[admin regular].freeze

  # Validación para que el rol esté dentro de los permitidos
  validates :role, inclusion: { in: ROLES }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Método para comprobar si el usuario es admin
  def admin?
    role == 'admin'
  end

  private

  # Método para establecer el rol por defecto
  def set_default_role
    self.role ||= 'regular'
  end
end
