class Conjured

  attr_reader :item

  def initialize(item)
    @item = item
  end

  def tick
    item.sell_in -= 1
    return if item.quality == 0
    item.quality -= 2
  end
end
