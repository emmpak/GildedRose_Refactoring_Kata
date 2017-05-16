require 'quality'

describe Quality do
  let(:elixir) { Item.new(name="Elixir of the Mongoose", sell_in=5, quality=10) }
  let(:vest) { Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20) }
  let(:brie) { Item.new(name="Aged Brie", sell_in=10, quality=35) }
  let(:sulfuras) { Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=10, quality=20) }
  let(:concert) { Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=11, quality=20)}
  subject(:quality) { described_class }

  describe '.is_degrading?' do
    context 'item quality is degrating with time if' do
      it 'is not special' do
        expect(quality.is_degrading?(elixir)).to eq true
        expect(quality.is_degrading?(vest)).to eq true
      end
    end

    context 'item quality is increasing with time if' do
      it 'is Aged brie' do
        expect(quality.is_degrading?(brie)).to eq false
      end

      it 'is Backstage pass' do
        expect(quality.is_degrading?(concert)).to eq false
      end
    end

    context 'item quality is not changing with time' do
      it 'is Sulfuras' do
        expect(quality.is_degrading?(sulfuras)).to eq false
      end
    end
  end

  describe '#update' do
    it 'decreases if regular item' do
      quality.update(elixir)
      expect { quality.update(elixir) }.to change { elixir.quality }.by -1
    end
  end
end
