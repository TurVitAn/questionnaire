RSpec.describe Answer, type: :model do
  context 'with associations' do
    it { is_expected.to belong_to(:result) }
    it { is_expected.to belong_to(:question) }
  end
end
