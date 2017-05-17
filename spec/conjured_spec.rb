require 'conjured'

describe Conjured do
  let(:item) { Item.new(name='Conjured', sell_in=10, quality=10 )}
  subject(:conjured) { described_class.new(item) }

  it 'quality decreases by 2 with each day until it reaches 0' do
    expect { conjured.tick }.to change { item.quality }.by -2
  end
end
