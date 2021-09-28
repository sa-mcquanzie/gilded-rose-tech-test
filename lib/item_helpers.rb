module ItemHelpers
  def is_ordinary(item)
    [
      "Aged Brie",
      "Backstage passes to a TAFKAL80ETC concert",
      "Sulfuras, Hand of Ragnaros"
    ].none?(item.name)
  end

  def within_date?(item)
    item.sell_in.positive?
  end

  def degrade(item, amount)
    item.quality -= amount
    item.quality = 0 if item.quality.negative?
  end

  def decrease_date(item)
    item.sell_in -= 1
  end
end
