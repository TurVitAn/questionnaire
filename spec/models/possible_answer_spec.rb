RSpec.describe PossibleAnswer, type: :model do
  context 'with associations' do
    it { is_expected.to belong_to(:question) }
  end

  context 'with validations' do
    it { is_expected.to validate_presence_of(:value) }
  end
end
