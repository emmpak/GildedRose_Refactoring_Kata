require 'gilded_rose'

describe GildedRose do
  let(:elixir) { Item.new(name="Elixir of the Mongoose", sell_in=5, quality=10) }
  let(:brie) { Item.new(name="Aged Brie", sell_in=10, quality=35) }
  let(:sulfuras) { Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=10, quality=20) }
  let(:concert) { Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=11, quality=20)}
  let(:items) { [elixir,brie,sulfuras,concert] }
  subject(:gilded_rose) { described_class.new(items) }

  context 'common features for the products' do

    it 'quality decreases by 1 with each day until it reaches 0 or the sell by date has not been passed' do
      expect { gilded_rose.update_quality }.to change { elixir.quality }.by -1
    end

    it 'quality cannot be a negative value' do
      10.times { gilded_rose.update_quality }
      expect { gilded_rose.update_quality }.not_to change { elixir.quality }
    end

    it 'quality decreases by 2 with each day once the sell by date has passed' do
      5.times { gilded_rose.update_quality }
      expect { gilded_rose.update_quality }.to change { elixir.quality }.by -2
    end
  end

  context 'Aged Brie' do

    it 'quality increases with time' do
      gilded_rose.update_quality
      expect { gilded_rose.update_quality }.to change { brie.quality }.by 1
    end

    it 'quality increases by 2 once the sell by date has passed' do
      10.times { gilded_rose.update_quality }
      expect { gilded_rose.update_quality }.to change { brie.quality }.by 2
    end

    it 'cannot have a quality value of more than 50' do
      15.times { gilded_rose.update_quality }
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

    it 'quality increase with time' do
      expect { gilded_rose.update_quality}.to change { concert.quality }.by 1
    end

    it 'quality increases by 2 when there are 10 days left' do
      gilded_rose.update_quality
      expect { gilded_rose.update_quality }.to change { concert.quality }.by 2
    end

    it 'quality increases by 3 when there are 5 days left' do
      6.times { gilded_rose.update_quality }
      expect { gilded_rose.update_quality }.to change { concert.quality }.by 3
    end

    it 'quality drops to 0 when sell by date has already passed' do
      12.times { gilded_rose.update_quality }
      expect(concert.quality).to eq 0
    end
  end
end
