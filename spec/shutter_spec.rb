require 'stock'

RSpec.describe Stock::Shutterstock do
  context 'shutter' do
    credentials = { client_id: 'fffe5-175c2-77e16-7c7da-9f85d-70870', client_secret: '401d0-a45c5-3d2c9-1e8c2-5f23b-17a80' }
    it 'initialize check and basic auth' do
      shutter = Stock::Shutterstock.new(credentials)
      expect(shutter.test_auth).to eq(200)
    end

    it 'get image' do
      shutter = Stock::Shutterstock.new(credentials)
      uri = shutter.get_image(321982310)
      expect(uri).to eq 'https://thumb1.shutterstock.com/thumb_large/1340161/321982310/stock-vector-vector-set-with-music-instruments-for-reggae-style-isolated-music-instruments-for-reggae-with-321982310.jpg'
      uri = shutter.get_image('321982310ab')
      expect(uri).to eq ''
    end

    it 'search images' do
      shutter = Stock::Shutterstock.new(credentials)
      result = shutter.search('reggae')
      expect(result.at(7)['id'].to_i).to eq 492046210
      result = shutter.search('iuaewrksdnmf')
      expect(result.empty?).to eq true
    end
  end
end
