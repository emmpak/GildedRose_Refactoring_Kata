require 'conjured'

describe Conjured do
  let(:item) { Item.new(name='Conjured', sell_in=5, quality=20 )}
  subject(:conjured) { described_class.new(item) }

  it 'quality decreases by 2 with each day until it reaches 0' do
    expect { conjured.tick }.to change { item.quality }.by -2
  end

  it 'quality decreases by 4 with each day once the sell by date has passed' do
    6.times { conjured.tick }
    expect { conjured.tick }.to change { item.quality }.by -4
  end
end
