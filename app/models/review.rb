class Review < ApplicationRecord
  # belongs_to :user
  belongs_to :professor
  has_one :rating, dependent: :destroy
  has_one :comment, dependent: :destroy

  accepts_nested_attributes_for :professor, :rating, :comment
end
