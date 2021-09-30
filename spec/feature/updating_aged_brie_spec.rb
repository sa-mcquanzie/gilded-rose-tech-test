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
