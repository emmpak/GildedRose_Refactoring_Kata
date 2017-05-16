require 'quality'

describe Quality do
  let(:elixir) { double(:elixir, name:"Elixir of the Mongoose", sell_in: 5, quality: 10) }
  let(:vest) { double(:vest, name:"+5 Dexterity Vest", sell_in: 10, quality: 20) }
  let(:brie) { Item.new(name="Aged Brie", sell_in=10, quality=35) }
  let(:sulfuras) { Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=10, quality=20) }
  let(:concert) { Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=11, quality=20)}
  subject(:quality) { described_class.new }

  describe '#is_degrating?' do
    context 'item quality is degrating with time if' do
      it 'is not special' do
        expect(quality.is_degrating?(elixir)).to eq true
        expect(quality.is_degrating?(vest)).to eq true
      end
    end

    context 'item quality is increasing with time if' do
      it 'is Aged brie' do
        expect(quality.is_degrating?(brie)).to eq false
      end

      it 'is Backstage pass' do
        expect(quality.is_degrating?(concert)).to eq false
      end
    end

    context 'item quality is not changing with time' do
      it 'is Sulfuras' do
        expect(quality.is_degrating?(sulfuras)).to eq false
      end
    end
  end
end
