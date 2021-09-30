module Categorizable
  def categorize
    items = {
      '+5 Dexterity Vest': { category: :ordinary },
      'Sulfuras, Hand of Ragnaros': { category: :legendary },
      'Aged Brie': { category: :ages_well },
      'Backstage passes to a TAFKAL80ETC concert': { category: :backstage_pass },
      'Conjured Mana Cake': { category: :conjured }
    }

    @category = items[name.to_sym][:category]
  end
end
