require 'stock'

RSpec.describe Stock::Shutterstock do
  context 'shutter' do
    it 'initialize check' do
      shutter = Stock::Shutterstock.new
      expect(shutter.headers['Authorization'].chomp).to eq('Basic NjE3ZjhlY2QwMjcwNDBlNGMwYTk6YzExYjk3NGRkMjQyMDU1YzZiZDEzMDFhMjYwOTFjNzdjNGRjYjVkYg==')
    end

    it 'get image' do
      shutter = Stock::Shutterstock.new
      uri = shutter.get_image(321982310)
      expect(uri).to eq 'https://thumb1.shutterstock.com/thumb_large/1340161/321982310/stock-vector-vector-set-with-music-instruments-for-reggae-style-isolated-music-instruments-for-reggae-with-321982310.jpg'
    end

    it 'search images' do
      shutter = Stock::Shutterstock.new
      result = shutter.search('reggae')
      expect(result.at(7)['id'].to_i).to eq 487421065
    end
  end
end
