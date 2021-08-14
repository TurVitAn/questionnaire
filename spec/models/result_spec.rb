RSpec.describe Result, type: :model do
  context 'with associations' do
    it { is_expected.to belong_to(:quiz) }
    it { is_expected.to have_many(:answers).dependent(:destroy) }
  end
end
