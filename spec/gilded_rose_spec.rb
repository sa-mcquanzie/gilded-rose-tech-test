require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    context 'updating an ordinary item' do
      ordinary_item = Item.new("toothpaste", 1, 20)
      gilded_rose = GildedRose.new([ordinary_item])

      context 'before the sell by date has passed' do
        it 'decreases the number of days in which to sell the item' do
          gilded_rose.update_quality
          expect(ordinary_item.sell_in).to be_zero
        end

        it 'decreases the quality of the item' do
          expect(ordinary_item.quality).to be(19)
        end
      end

      context 'after the sell by date has passed' do
        it 'continues to count down the days' do
          gilded_rose.update_quality
          expect(ordinary_item.sell_in).to be_negative
        end

        it 'decreases the quality of the item twice as fast' do
          expect(ordinary_item.quality).to be(17)
        end
      end

      context 'any time' do
        it 'will not cause quality to drop below zero' do
          10.times { gilded_rose.update_quality }

          expect(ordinary_item.quality).to be_zero
        end
      end
    end

    context 'updating Sulfuras, Hand of Ragnaros' do
      sulfuras = Item.new("Sulfuras, Hand of Ragnaros", 1, 80)
      gilded_rose = GildedRose.new([sulfuras])

      context 'before the sell by date has passed' do
        it 'decreases the number of days in which to sell the item' do
          gilded_rose.update_quality
          expect(sulfuras.sell_in).to be_zero
        end

        it 'does not change the quality of the item' do
          expect(sulfuras.quality).to be(80)
        end
      end

      context 'after the sell by date has passed' do
        it 'continues to count down the days' do
          gilded_rose.update_quality
          expect(sulfuras.sell_in).to be_negative
        end

        it 'still has no effect on the quility of the item' do
          expect(sulfuras.quality).to be(80)
        end
      end
    end
  end
end
