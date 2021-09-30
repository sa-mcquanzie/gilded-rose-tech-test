require 'updateable'

describe Updateable do
  class FakeItem
    attr_accessor :category, :sell_in, :quality

    def initialize
      @category, @sell_in, @quality = nil, nil, nil
    end
  end

  let(:item) { FakeItem.new.extend(subject) }

  context 'when another object extends it' do    
    describe '#update' do
      it 'decreases the sell_in time by 1' do
        item.category = :ordinary
        item.sell_in = 5
        item.quality = 2

        item.update
        expect(item.sell_in).to eq(4)
      end

      context 'for ordinary items' do
        before { item.category = :ordinary }

        it 'reduces the quality by 1 before the sell_in days run out' do
          item.sell_in = 5
          item.quality = 2

          item.update
          expect(item.quality).to eq(1)
        end

        it 'reduces the quality by 2 after the sell_in days run out' do
          item.sell_in = 0
          item.quality = 4

          item.update
          expect(item.quality).to eq(2)
        end
      end

      context 'for items that age well' do
        before { item.category = :ages_well }

        it 'increases the quality by 1 before the sell_in days run out' do
          item.sell_in = 5
          item.quality = 2

          item.update
          expect(item.quality).to eq(3)
        end

        # it 'reduces the quality by 2 after the sell_in days run out' do
        #   item.sell_in = 0
        #   item.quality = 4

        #   item.update
        #   expect(item.quality).to eq(2)
        # end
      end
    end
  end
end
