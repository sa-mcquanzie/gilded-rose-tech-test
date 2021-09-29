require_relative 'item_helpers'

class GildedRose
  include ItemHelpers

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      update_ordinary(item) if ordinary?(item)
      update_backstage_pass(item) if backstage_pass?(item)
      update_brie(item) if aged_brie?(item)
      age(item) if sulfuras?(item)
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
