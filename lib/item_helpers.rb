module ItemHelpers
  def ordinary?(item)
    [
      "Aged Brie",
      "Backstage passes to a TAFKAL80ETC concert",
      "Sulfuras, Hand of Ragnaros"
    ].none?(item.name)
  end

  def sulfuras?(item)
    item.name == "Sulfuras, Hand of Ragnaros"
  end

  def aged_brie?(item)
    item.name == "Aged Brie"
  end

  def within_date?(item)
    item.sell_in >= 0
  end

  def past_date?(item)
    !within_date?(item)
  end

  def degrade(item, amount)
    item.quality = item.quality - amount
    item.quality = 0 if item.quality.negative?
  end

  def decrease_date(item)
    item.sell_in -= 1
  end

  def update_ordinary(item)
    decrease_date(item)
    within_date?(item) ? degrade(item, 1) : degrade(item, 2)
  end
end
