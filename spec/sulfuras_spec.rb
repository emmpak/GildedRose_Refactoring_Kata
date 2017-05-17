require 'sulfuras'

describe Sulfuras do
  let(:item) { Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=10, quality=20) }
  subject(:sulfuras) { described_class.new(item) }

  it 'sell_in value and quality do not decrease with time' do
    expect { sulfuras.tick }.not_to change { item.quality }
    expect { sulfuras.tick }.not_to change { item.sell_in }
  end
end
