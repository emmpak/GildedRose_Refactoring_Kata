class GildedRose

  attr_reader :items

  def initialize(items)
    @items = items
  end

  def normal_tick(item)
    item.sell_in -= 1
    return if item.quality == 0
    item.quality -= 1
    item.quality -= 1 if item.sell_in <= 0
  end

  def brie_tick(item)
    item.sell_in -= 1
    return if item.quality >= 50
    item.quality += 1
    item.quality += 1 if item.sell_in <= 0
  end

  def sulfuras_tick(item)
  end

  def backstage_tick(item)
    item.sell_in -= 1
    return if item.quality == 50
    return item.quality = 0 if item.sell_in < 0
    item.quality += 1
    item.quality += 1 if item.sell_in < 10
    item.quality += 1 if item.sell_in < 5
  end

  def update_quality
    items.each do |item|
      case item.name
      when "Aged Brie"
        brie_tick(item)
      when "Sulfuras, Hand of Ragnaros"
        sulfuras_tick(item)
      when "Backstage passes to a TAFKAL80ETC concert"
        backstage_tick(item)
      else
        normal_tick(item)
      end
    end
  end
end

      # if item.name == 'Elixir of the Mongoose'
      #   return normal_tick(item)
      # end

  #     if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
  #       item.quality = item.quality - 1 if item.quality > 0 && item.name != "Sulfuras, Hand of Ragnaros"
  #     else
  #       if item.quality < 50
  #         item.quality = item.quality + 1
  #         if item.name == "Backstage passes to a TAFKAL80ETC concert"
  #           if item.sell_in < 11 && item.quality < 50
  #               item.quality = item.quality + 1
  #           end
  #           if item.sell_in < 6 && item.quality < 50
  #               item.quality = item.quality + 1
  #           end
  #         end
  #       end
  #     end
  #     if item.name != "Sulfuras, Hand of Ragnaros"
  #       item.sell_in = item.sell_in - 1
  #     end
  #     if item.sell_in < 0
  #       if item.name != "Aged Brie"
  #         if item.name != "Backstage passes to a TAFKAL80ETC concert"
  #           if item.quality > 0
  #             if item.name != "Sulfuras, Hand of Ragnaros"
  #               item.quality = item.quality - 1
  #             end
  #           end
  #         else
  #           item.quality = item.quality - item.quality
  #         end
  #       else
  #         if item.quality < 50
  #           item.quality = item.quality + 1
  #         end
  #       end
  #     end
  #   end
  # end

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
