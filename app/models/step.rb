class Step < ApplicationRecord
  belongs_to :quiz
  has_many :questions, dependent: :destroy

  validates :position, presence: true
  validates :position, uniqueness: { scope: :quiz_id }
end
