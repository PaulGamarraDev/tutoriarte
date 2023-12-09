class User < ApplicationRecord
  validates :first_name, :last_name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  enum role: {
    Profesor: 0,
    Estudiante: 1,
  }

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :Profesor
  end
end
