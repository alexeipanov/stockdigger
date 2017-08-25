require 'stock'

RSpec.describe Stock::Shutterstock do
  context 'Shutterstock_auth' do

    it 'initialize check' do
      shutter = Stock::Shutterstock.new
      expect(shutter.headers['Authorization'].chomp).to eq('Basic NjE3ZjhlY2QwMjcwNDBlNGMwYTk6YzExYjk3NGRkMjQyMDU1YzZiZDEzMDFhMjYwOTFjNzdjNGRjYjVkYg==')
    end

    it 'get test image' do
      shutter = Stock::Shutterstock.new
      uri = shutter.get_image(321982310)
      expect(uri).to eq 'https://image.shutterstock.com/display_pic_with_logo/3434738/487421065/stock-photo-reggae-colors-flag-crochet-knitted-style-background-top-view-collage-with-mirror-reflection-487421065.jpg'
    end
  end
end
