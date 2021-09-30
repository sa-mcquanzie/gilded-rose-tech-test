require 'categorizable'

describe Categorizable do
  context 'when another object extends it' do
    let(:fake_item) { Class.new { extend Categorizable } }

    describe '#categorize' do
      it 'categorizes that object correctly if it is ordinary' do
        allow(fake_item).to receive(:name).and_return('+5 Dexterity Vest')

        expect(fake_item.categorize).to eq(:ordinary)
      end

      it 'categorizes that object correctly if it is legendary' do
        allow(fake_item)
        .to receive(:name).and_return('Sulfuras, Hand of Ragnaros')

        expect(fake_item.categorize).to eq(:legendary)
      end

      it 'categorizes that object correctly if it ages well' do
        allow(fake_item).to receive(:name).and_return('Aged Brie')

        expect(fake_item.categorize).to eq(:ages_well)
      end

      it 'categorizes that object correctly if it is a backstage_pass' do
        allow(fake_item)
        .to receive(:name)
        .and_return('Backstage passes to a TAFKAL80ETC concert')

        expect(fake_item.categorize).to eq(:backstage_pass)
      end
    end
  end
end
