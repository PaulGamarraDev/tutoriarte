class User < ApplicationRecord
  validates :first_name, :last_name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy

  # ROLES = ['Profesor','Estudiante']

  enum role: %i[teacher student] # asocio que pos 0 es teacher (0 en db y teacher muestra rails en terminal)

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :student
  end
end
