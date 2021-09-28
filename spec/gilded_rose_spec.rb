require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    context 'updating an ordinary item' do
      context 'before the sell by date has passed' do
        ordinary_item = Item.new("toothpaste", 10, 20)
        gilded_rose = GildedRose.new([ordinary_item])

        it 'decreases the number of days in which to sell the item' do
          gilded_rose.update_quality
          expect(ordinary_item.sell_in). to be(9)
        end

        it 'decreases the quality of the item' do
          expect(ordinary_item.quality). to be(19)
        end
      end
    end
  end

end
