require 'categorizable'
require 'item'
require 'updateable'

class GildedRose
  def initialize(items)
    @items = items
    
    @items.each do |item|
      item
      .extend(Categorizable)
      .extend(Updateable)
      .categorize
    end
  end

  def update_quality
    @items.each { |item| item.update }
  end  
end
