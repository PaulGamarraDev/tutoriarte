class User < ApplicationRecord
  validates :first_name, :last_name, :role, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLES = [[0, 'Teacher'], [1, 'Student']]

  enum role: %i[teacher student]

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :student
  end
end
