require 'brie'

describe Brie do
  let(:item) { Item.new(name="Aged Brie", sell_in=10, quality=35) }
  subject(:brie) { described_class.new(item) }

  it 'quality increases with time' do
    brie.tick
    expect { brie.tick }.to change { item.quality }.by 1
  end

  it 'quality increases by 2 once the sell by date has passed' do
    10.times { brie.tick }
    expect { brie.tick }.to change { item.quality }.by 2
  end

  it 'cannot have a quality value of more than 50' do
    15.times { brie.tick }
    expect { brie.tick }.not_to change { item.quality }
  end
end
