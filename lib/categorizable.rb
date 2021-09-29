module Categorizable
  def categorize
    items = {
      'Toothpaste': {
        category: :ordinary
      },
      'Sulfuras, Hand of Ragnaros': {
        category: :legendary
      },
      'Aged Brie': {
        category: :ages_well
      },
      'Backstage passes to a TAFKAL80ETC concert': {
        category: :backstage_pass
      }
    }

    @category = items[self.name.to_sym][:category]
  end
end
