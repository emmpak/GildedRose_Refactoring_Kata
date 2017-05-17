require_relative './item'
require_relative './normal'
require_relative './brie'
require_relative './concert'
require_relative './sulfuras'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    items.each { |item| klass_for(item.name).new(item).tick }
  end

private
  attr_reader :items

  def klass_for(name)
    case name
    when "Aged Brie"
      Brie
    when "Sulfuras, Hand of Ragnaros"
      Sulfuras
    when "Backstage passes to a TAFKAL80ETC concert"
      Concert
    when "Conjured"
      Conjured
    else
      Normal
    end
  end
end
