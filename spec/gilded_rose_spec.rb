require 'gilded_rose'

describe GildedRose do
  let(:elixir) { Item.new(name="Elixir of the Mongoose", sell_in=5, quality=1) }
  let(:brie) { Item.new(name="Aged Brie", sell_in=10, quality=49) }
  let(:items) { [elixir, brie] }
  subject(:gilded_rose) { described_class.new(items) }

  context 'regular products' do

    it 'quality decreases by 1 with each day until quality is 0' do
      expect { gilded_rose.update_quality }.to change { elixir.quality }.by -1
    end

    it 'quality cannot be a negative value' do
      gilded_rose.update_quality
      expect { gilded_rose.update_quality }.not_to change { elixir.quality }
    end
  end

  context 'aged brie' do

    it 'quality increases with time' do
      expect { gilded_rose.update_quality }.to change { brie.quality }.by 1
    end

    it 'cannot have a quality value of more than 50' do
      # expect { 2.times{ gilded_rose.update_quality } }.to change { elixir.quality }.by -1
    end
  end
end
