require 'concert'

describe Concert do
  let(:item) { Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=11, quality=20)}
  subject(:concert) { described_class.new(item) }


  it 'quality increase with time' do
    expect { concert.tick}.to change { item.quality }.by 1
  end

  it 'quality increases by 2 when there are 10 days left' do
    concert.tick
    expect { concert.tick }.to change { item.quality }.by 2
  end

  it 'quality increases by 3 when there are 5 days left' do
    6.times { concert.tick }
    expect { concert.tick }.to change { item.quality }.by 3
  end

  it 'quality drops to 0 when sell by date has already passed' do
    12.times { concert.tick }
    expect(item.quality).to eq 0
  end
end
