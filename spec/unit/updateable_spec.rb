require 'updateable'

class FakeItem
  attr_accessor :category, :sell_in, :quality
end

describe Updateable do
  let(:item) { FakeItem.new.extend(subject) }

  context 'when another object extends it' do    
    describe '#update' do
      context 'for all items' do
        before do
          item.sell_in = 1
          item.quality = 2
        end

        it 'decreases the sell_in days by 1' do
          item.update
          expect(item.sell_in).to eq(0)
        end
      end

      context 'for perishable items' do
        before do
          item.sell_in = 1
          item.quality = 2
        end

        it 'limits the minimum quality to 0 for ordinary items' do
          item.category = :ordinary
          3.times { item.update }

          expect(item.quality).to eq(0)
        end
      end

      context 'for items whose quality appreciates over time' do
        before do
          item.sell_in = 4
          item.quality = 49
        end

        it 'limits the maximum quality to 50 for items in the ages_well category' do
          item.category = :ages_well
          2.times { item.update }

          expect(item.quality).to eq(50)
        end

        it 'limits the maximum quality to 50 for items in the backstage_pass category' do
          item.category = :backstage_pass
          2.times { item.update }

          expect(item.quality).to eq(50)
        end
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

        it 'still increases the quality by 1 after the sell_in days run out' do
          item.sell_in = -1
          item.quality = 4

          item.update
          expect(item.quality).to eq(5)
        end
      end

      context 'for legendary items' do
        before do
          item.category = :legendary
          item.quality = 80
        end

        it 'has no effect on the quality before the sell_in days run out' do
          item.sell_in = 5
          item.update
          expect(item.quality).to eq(80)
        end

        it 'still has no effect on the quality after the sell_in days run out' do
          item.sell_in = -5
          item.update
          expect(item.quality).to eq(80)
        end
      end

      context 'for backstage passes' do
        before do
          item.category = :backstage_pass
          item.quality = 10
        end

        it 'increases the quality by 1 with more than 10 sell_in days left' do
          item.sell_in = 20
          item.update
          expect(item.quality).to eq(11)
        end

        it 'increases the quality by 2 with 5 to 10 sell_in days left' do
          item.sell_in = 10
          item.update
          expect(item.quality).to eq(12)

          item.sell_in = 6
          item.update
          expect(item.quality).to eq(14)
        end

        it 'increases the quality by 3 with 0 to 5 sell_in days left' do
          item.sell_in = 5
          item.update
          expect(item.quality).to eq(13)

          item.sell_in = 1
          item.update
          expect(item.quality).to eq(16)
        end

        it 'reduces the quality to zero when there are no sell_in days left' do
          item.sell_in = 0
          item.update
          expect(item.quality).to eq(0)
        end
      end
    end
  end
end
