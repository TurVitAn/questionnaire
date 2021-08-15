class PossibleAnswer < ApplicationRecord
  belongs_to :question

  validates :value, :position, presence: true
  validates :position, uniqueness: { scope: :question_id }
end
