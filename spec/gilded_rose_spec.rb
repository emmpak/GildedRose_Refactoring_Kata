require 'gilded_rose'

describe GildedRose do
  let(:elixir) { Item.new(name="Elixir of the Mongoose", sell_in=5, quality=10) }
  let(:brie) { Item.new(name="Aged Brie", sell_in=10, quality=49) }
  let(:sulfuras) { Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=10, quality=30) }
  let(:items) { [elixir, brie, sulfuras] }
  subject(:gilded_rose) { described_class.new(items) }

  context 'common features for the products' do

    it 'quality decreases by 1 with each day until it reaches 0 or the sell by date has not been passed' do
      expect { gilded_rose.update_quality }.to change { elixir.quality }.by -1
    end

    it 'quality cannot be a negative value' do
      10.times { gilded_rose.update_quality }
      expect { gilded_rose.update_quality }.not_to change { elixir.quality }
    end

    it 'qulity decreases by 2 with each day once the sell by date has passed' do
      5.times { gilded_rose.update_quality }
      expect { gilded_rose.update_quality }.to change { elixir.quality }.by -2
    end
  end

  context 'Aged Brie' do

    it 'quality increases with time' do
      expect { gilded_rose.update_quality }.to change { brie.quality }.by 1
    end

    it 'cannot have a quality value of more than 50' do
      gilded_rose.update_quality
      expect { gilded_rose.update_quality }.not_to change { brie.quality }
    end
  end

  context 'Sulfuras' do

    it 'sell_in value and quality do not decrease with time' do
      expect { gilded_rose.update_quality }.not_to change { sulfuras.quality }
      expect { gilded_rose.update_quality }.not_to change { sulfuras.sell_in }
    end
  end

  context 'Backstage passes' do

  end
end
