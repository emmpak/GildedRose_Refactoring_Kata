class Concert
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def tick
    item.sell_in -= 1
    return if item.quality == 50
    return item.quality = 0 if item.sell_in < 0
    item.quality += 1
    item.quality += 1 if item.sell_in < 10
    item.quality += 1 if item.sell_in < 5
  end
end
