context 'updating Backstage passes to a TAFKAL80ETC concert' do
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
