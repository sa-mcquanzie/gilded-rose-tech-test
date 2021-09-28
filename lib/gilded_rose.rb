require_relative 'item_helpers'

class GildedRose
  include ItemHelpers

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      decrease_date(item)

      if ordinary?(item)
        degrade(item, 1)
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end


      if past_date?(item)
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros" #it is ordinary
                degrade(item, 1)
              end
            end
          else # it is a backstage pass
            item.quality = item.quality - item.quality
          end
        else # it is aged brie
        end
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
