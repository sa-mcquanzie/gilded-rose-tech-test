context 'updating Conjured Mana Cake' do
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
