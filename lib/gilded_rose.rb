require_relative 'item_helpers'

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

module Updateable
  include ItemHelpers

  def update
      case @category
      when :ordinary
        within_date?(self) ? depreciate(self, 1) : depreciate(self, 2)
      when :ages_well
        appreciate(self, 1)
      when :backstage_pass
        unless within_date?(self)
          zero_quality(self)
          return
        end
        appreciate(self, 1)
        appreciate(self, 1) if self.sell_in < 11
        appreciate(self, 1) if self.sell_in < 6
      else
      end

      age
  end

  def age
    self.sell_in -= 1
  end
end

class GildedRose
  def initialize(items)
    @items = items
    @items.each do |item|
      item.extend(Categorizable).extend(Updateable).categorize
    end
  end

  def update_quality
    @items.each { |item| item.update }
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
