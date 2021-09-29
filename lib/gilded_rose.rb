require_relative 'item_helpers'

class GildedRose
  include ItemHelpers

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if sulfuras?(item)
        age(item)
        next
      end

      if ordinary?(item)
        update_ordinary(item)
        next
      end

      if backstage_pass?(item)
        update_backstage_pass(item)
        next
      end

      if aged_brie?(item)
        update_brie(item)
        next
      end
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
