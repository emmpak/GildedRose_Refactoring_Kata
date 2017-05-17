require 'gilded_rose'

describe GildedRose do
  let(:elixir) { Item.new(name="Elixir of the Mongoose", sell_in=5, quality=10) }
  let(:brie) { Item.new(name="Aged Brie", sell_in=10, quality=35) }
  let(:sulfuras) { Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=10, quality=20) }
  let(:concert) { Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=11, quality=20)}
  let(:items) { [elixir,brie,sulfuras,concert] }
  subject(:gilded_rose) { described_class.new(items) }

  describe '#update_quality' do
    it 'returns Brie class for an Aged Brie item' do

    end
  end
end
