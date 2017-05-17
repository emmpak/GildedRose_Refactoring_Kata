class GildedRose

  attr_reader :items

  def initialize(items)
    @items = items
  end

  def klass_for(name)
    case name
    when "Aged Brie"
      Brie
    when "Sulfuras, Hand of Ragnaros"
      Sulfuras
    when "Backstage passes to a TAFKAL80ETC concert"
      Concert
    else
      Normal
    end
  end

  def update_quality
    items.each { |item| klass_for(item.name).new(item).tick }
  end
end
