class Step < ApplicationRecord
  belongs_to :quiz
  has_many :questions, dependent: :destroy
end
