RSpec.describe Quiz, type: :model do
  context 'with associations' do
    it { is_expected.to have_many(:steps).dependent(:destroy) }
    it { is_expected.to have_many(:results).dependent(:destroy) }
  end

  context 'with validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:slug) }
  end
end
