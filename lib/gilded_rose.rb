require_relative 'item_helpers'

module Updateable
  include ItemHelpers

  def update
      update_ordinary if ordinary?(self)
      update_backstage_pass if backstage_pass?(self)
      update_brie if aged_brie?(self)
      update_sulfuras if sulfuras?(self)
      age
  end

  def update_ordinary
    within_date?(self) ? depreciate(self, 1) : depreciate(self, 2)
  end

  def update_backstage_pass
    unless within_date?(self)
      zero_quality(self)
      return
    end

    appreciate(self, 1)
    appreciate(self, 1) if self.sell_in < 11
    appreciate(self, 1) if self.sell_in < 6
  end

  def update_brie
    appreciate(self, 1)
  end

  def update_sulfuras
    return
  end

  def age
    self.sell_in -= 1
  end
end

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each { |item| item.extend(Updateable).update }
    end
  end  
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
