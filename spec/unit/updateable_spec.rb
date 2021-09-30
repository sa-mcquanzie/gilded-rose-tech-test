require 'updateable'

describe Updateable do
  class FakeItem
    attr_accessor :category, :sell_in, :quality

    def initialize(category, sell_in, quality)
      @category, @sell_in, @quality = category, sell_in, quality
    end
  end

  context 'when another object extends it' do    
    describe '#update' do
      it 'decreases the sell_in time by 1' do
        item = FakeItem.new(:ordinary, 5, 2).extend(subject)

        allow(item).to receive(:within_date?)
        allow(item).to receive(:depreciate)

        item.update
        expect(item.sell_in).to eq(4)
      end
    end
  end
end
