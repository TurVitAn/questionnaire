class Question < ApplicationRecord
  belongs_to :step
  has_many :possible_answers, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :value, :answer_type, :position, presence: true
  validates :position, uniqueness: { scope: :step_id }

  enum answer_type: { 'STRING' => 0, 'INTEGER' => 1, 'RADIO' => 2, 'CHECKBOXES' => 3 }
end
