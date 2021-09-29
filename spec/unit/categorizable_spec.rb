require 'categorizable'

describe Categorizable do
  context 'when another class extends it' do
    let(:fake_item) { Class.new { extend Categorizable } }

    it 'categorizes instances of that class' do
      allow(fake_item).to receive(:name).and_return('Toothpaste')

      expect(fake_item.categorize).to eq(:ordinary)
    end
  end
end
