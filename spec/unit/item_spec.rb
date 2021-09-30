require 'item'

describe Item do
  subject { Item.new('Apple', 4, 2) }
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:sell_in) }
  it { is_expected.to respond_to(:quality) }

  describe '#to_s' do
    it 'returns its attributes as a string' do
      expect(subject.to_s).to eq('Apple, 4, 2')
    end
  end
end
