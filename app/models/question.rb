class Question < ApplicationRecord
  belongs_to :step
  has_many :possible_answers, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :value, presence: true

  enum answer_type: {'STRING' => 0, 'INTEGER' => 1, 'RADIO' => 2, 'CHECKBOXES' => 3}
end
