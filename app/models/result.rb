class Result < ApplicationRecord
  belongs_to :quiz
  has_many :answers, dependent: :destroy

  validates :uid, presence: true
  validates :uid, uniqueness: { scope: :quiz_id }
end
