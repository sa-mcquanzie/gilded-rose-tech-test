require 'gilded_rose'

describe GildedRose do
  it 'updates a single item' do
    items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 21, 5)]

    GildedRose.new(items).update_quality

    expect(items[0].name).to eq('Backstage passes to a TAFKAL80ETC concert')
    expect(items[0].sell_in).to eq(20)
    expect(items[0].quality).to eq(6)
  end

  it 'updates several items' do
    items = [
      Item.new('+5 Dexterity Vest', 10, 20),
      Item.new('Aged Brie', 2, 0),
      Item.new('Elixir of the Mongoose', 5, 7),
      Item.new('Sulfuras, Hand of Ragnaros', 0, 80),
      Item.new('Sulfuras, Hand of Ragnaros', -1, 80),
      Item.new('Backstage passes to a TAFKAL80ETC concert', 15, 20),
      Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 49),
      Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 49),
      Item.new('Conjured Mana Cake', 3, 6)
    ]

    updated_items = [
      '+5 Dexterity Vest, 9, 19',
      'Aged Brie, 1, 1',
      'Elixir of the Mongoose, 4, 6',
      'Sulfuras, Hand of Ragnaros, 0, 80',
      'Sulfuras, Hand of Ragnaros, -1, 80',
      'Backstage passes to a TAFKAL80ETC concert, 14, 21',
      'Backstage passes to a TAFKAL80ETC concert, 9, 50',
      'Backstage passes to a TAFKAL80ETC concert, 4, 50',
      'Conjured Mana Cake, 2, 4'
    ].join("\n")

    GildedRose.new(items).update_quality

    expect(items.map(&:to_s).join("\n")).to eq(updated_items)
  end
end
