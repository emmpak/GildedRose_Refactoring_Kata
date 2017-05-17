descrbe Normal do
  let(:elixir) { Item.new(name="Elixir of the Mongoose", sell_in=5, quality=10) }
  subject(item) { described_class.new(elixir) }

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
