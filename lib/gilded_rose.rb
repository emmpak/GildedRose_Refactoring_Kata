class GildedRose

  attr_reader :items

  def initialize(items)
    @items = items
  end

  def sulfuras_tick(item)
  end

  def update_quality
    items.each do |item|
      case item.name
      when "Aged Brie"
        Brie.new(item).tick
      when "Sulfuras, Hand of Ragnaros"
        sulfuras_tick(item)
      when "Backstage passes to a TAFKAL80ETC concert"
        Concert.new(item).tick
      else
        Normal.new(item).tick
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
