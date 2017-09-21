require 'rails_helper'

RSpec.describe Collection, type: :model do

  it 'is valid with valid attributes' do
  	image = Image.create({ collection_id: 1, image: 'image' })
    expect(image).to be_valid
  end

  it 'is invalid with empty image' do
  	image = Image.create({ collection_id: 1, image: nil })
    expect(image).to_not be_valid
  end

  it 'is invalid with not unique image and same collection' do
  	image_1 = Image.create({ collection_id: 1, image: 'image' })
  	image_2 = Image.create({ collection_id: 1, image: 'image' })
  	expect(image_1).to be_valid
    expect(image_2).to_not be_valid
  end

  it 'is valid with unique image and not same user' do
  	image_1 = Image.create({ collection_id: 1, image: 'image' })
  	image_2 = Image.create({ collection_id: 2, image: 'image' })
  	expect(image_1).to be_valid
    expect(image_2).to be_valid
  end

end
