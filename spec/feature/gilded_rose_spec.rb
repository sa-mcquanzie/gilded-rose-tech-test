require 'gilded_rose'

describe GildedRose do

  describe "updating items" do
    context 'updating an ordinary item' do
      ordinary_item = Item.new("Toothpaste", 1, 20)
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

    context 'updating a conjured item' do
      conjured_item = Item.new('Conjured Mana Cake', 1, 20)
      gilded_rose = GildedRose.new([conjured_item])

      context 'before the sell by date has passed' do
        it 'decreases the number of days in which to sell the item' do
          gilded_rose.update_quality
          expect(conjured_item.sell_in).to be_zero
        end

        it 'decreases the quality of the item by 2' do
          expect(conjured_item.quality).to be(18)
        end
      end

      context 'after the sell by date has passed' do
        it 'continues to count down the days' do
          gilded_rose.update_quality
          expect(conjured_item.sell_in).to be_negative
        end

        it 'decreases the quality of the item by 4' do
          expect(conjured_item.quality).to be(14)
        end
      end

      context 'any time' do
        it 'will not cause quality to drop below zero' do
          10.times { gilded_rose.update_quality }

          expect(conjured_item.quality).to be_zero
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

        it 'still has no effect on the quality of the item' do
          expect(sulfuras.quality).to be(80)
        end
      end
    end

    context 'updating Aged Brie' do
      brie = Item.new("Aged Brie", 1, 0)
      gilded_rose = GildedRose.new([brie])

      context 'before the sell by date has passed' do
        it 'decreases the number of days in which to sell the item' do
          gilded_rose.update_quality
          expect(brie.sell_in).to be_zero
        end

        it 'increases the quality of the item' do
          expect(brie.quality).to be(1)
        end
      end

      context 'after the sell by date has passed' do
        it 'continues to count down the days' do
          gilded_rose.update_quality

          expect(brie.sell_in).to be_negative
        end

        it 'continues to increase the quality of the item' do
          expect(brie.quality).to be(2)
        end
      end

      context 'any time' do
        it 'will not raise quality above 50' do
          50.times { gilded_rose.update_quality }

          expect(brie.quality).to be(50)
        end
      end
    end

    context 'updating a Backstage Pass' do
      pass = Item.new("Backstage passes to a TAFKAL80ETC concert", 21, 5)
      gilded_rose = GildedRose.new([pass])

      context 'with more than ten days until the concert' do
        it 'decreases the number of days in which to sell the item' do
          gilded_rose.update_quality
          expect(pass.sell_in).to be(20)
        end

        it 'increases the quality of the item by one' do
          expect(pass.quality).to be(6)
        end

        it 'keeps increasing quality by one until there are ten days left' do
          10.times { gilded_rose.update_quality }
          expect(pass.quality).to be(16)
        end
      end

      context 'with six-to-ten days until the concert' do
        it 'increases the quality of the item by two' do
          gilded_rose.update_quality
          expect(pass.quality).to be(18)
        end

        it 'keeps increasing quality by two until there are five days left' do
          4.times { gilded_rose.update_quality }
          expect(pass.quality).to be(26)
        end
      end

      context 'with fewer than five days until the concert' do
        it 'increases the quality of the item by three' do
          gilded_rose.update_quality
          expect(pass.quality).to be(29)
        end

        it 'keeps increasing quality by three until the day of the concert' do
          4.times { gilded_rose.update_quality }
          expect(pass.quality).to be(41)
        end
      end

      context 'after the concert' do
        it "destroys item's value" do
          gilded_rose.update_quality

          expect(pass.quality).to be_zero
        end
      end
    end
  end
end
