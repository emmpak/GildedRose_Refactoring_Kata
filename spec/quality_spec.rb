require 'quality'

describe Quality do
  let(:elixir) { double(:elixir, name:"Elixir of the Mongoose", sell_in: 5, quality: 10) }
  subject(:quality) { described_class.new }

  describe '#is_degrating?' do
    it 'returns whether the item is degrating with time' do
      expect(quality.is_degrating?(elixir)).to eq true
    end
  end
end
