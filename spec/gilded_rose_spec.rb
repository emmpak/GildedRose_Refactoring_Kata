require 'gilded_rose'

describe GildedRose do
  let(:elixir) { Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7) }
  let(:items) { [elixir] }
  subject(:gilded_rose) { described_class.new(items) }

  context 'regular products' do
    # brefore do
    #   item = Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7),
    # end

    it 'quality decreases by 1 with each day' do
      expect { gilded_rose.update_quality }.to change { elixir.sell_in }.by -1
      expect { gilded_rose.update_quality }.to change { elixir.quality }.by -1
    end
  end
end
