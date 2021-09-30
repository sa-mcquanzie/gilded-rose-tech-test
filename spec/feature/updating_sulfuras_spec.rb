context 'updating Sulfuras, Hand of Ragnaros' do
  sulfuras = Item.new("Sulfuras, Hand of Ragnaros", 0, 80)
  gilded_rose = GildedRose.new([sulfuras])

  it 'has no effect on the sell by date' do
    gilded_rose.update_quality
    expect(sulfuras.sell_in).to be_zero
  end

  it 'does not change the quality of the item' do
    expect(sulfuras.quality).to be(80)
  end
end
