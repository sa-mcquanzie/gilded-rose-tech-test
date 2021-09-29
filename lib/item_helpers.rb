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

  def backstage_pass?(item)
    item.name == "Backstage passes to a TAFKAL80ETC concert"
  end

  def within_date?(item)
    item.sell_in.positive?
  end

  def past_date?(item)
    !within_date?(item)
  end

  def appreciate(item, amount)
    item.quality += amount
    item.quality = 50 if item.quality > 50
  end

  def depreciate(item, amount)
    item.quality -= amount
    item.quality = 0 if item.quality.negative?
  end

  def zero_quality(item)
    item.quality = 0
  end
end
