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
