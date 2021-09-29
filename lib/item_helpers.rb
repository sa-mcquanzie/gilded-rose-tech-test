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

  def age(item)
    item.sell_in -= 1
  end

  def zero_quality(item)
    item.quality = 0
  end

  def update_ordinary(item)
    within_date?(item) ? depreciate(item, 1) : depreciate(item, 2)
  end

  def update_backstage_pass(item)
    unless within_date?(item)
      zero_quality(item)
      return
    end

    appreciate(item, 1)
    appreciate(item, 1) if item.sell_in < 11
    appreciate(item, 1) if item.sell_in < 6
  end

  def update_brie(item)
    appreciate(item, 1)
  end

  def update_sulfuras(item)
    return
  end
end
