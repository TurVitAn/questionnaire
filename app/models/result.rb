class Result < ApplicationRecord
  belongs_to :quiz
  has_many :answers, dependent: :destroy
end
