module Categorizable
  def categorize
    items = {
      '+5 Dexterity Vest': { category: :ordinary },
      'Elixir of the Mongoose': { category: :ordinary },
      'Sulfuras, Hand of Ragnaros': { category: :legendary },
      'Aged Brie': { category: :ages_well },
      'Backstage passes to a TAFKAL80ETC concert': { category: :backstage_pass },
      'Conjured Mana Cake': { category: :conjured }
    }

    n = name.to_sym

    @category = items.key?(n) ? items[n][:category] : :ordinary
  end
end
