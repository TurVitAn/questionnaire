RSpec.describe Question, type: :model do
  subject(:question) { described_class.new }

  context 'with associations' do
    it { is_expected.to belong_to(:step) }
    it { is_expected.to have_many(:possible_answers).dependent(:destroy) }
    it { is_expected.to have_many(:answers).dependent(:destroy) }
  end

  context 'with validations' do
    it { is_expected.to validate_presence_of(:value) }
  end

  describe 'with enum for answer_type' do
    it {
      expect(question).to define_enum_for(:answer_type)
        .with_values('STRING' => 0, 'INTEGER' => 1, 'RADIO' => 2, 'CHECKBOXES' => 3)
    }
  end
end
