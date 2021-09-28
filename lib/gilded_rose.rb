require_relative 'item_helpers'

class GildedRose
  include ItemHelpers

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if ordinary?(item)
        depreciate(item, 1)
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
        depreciate(item, 1) if ordinary?(item)
        zero_quality(item) if backstage_pass(item)
      end



      age(item)    
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
