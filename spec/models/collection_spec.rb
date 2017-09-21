require 'rails_helper'

RSpec.describe Collection, type: :model do
  it 'is valid with valid attributes' do
  	collection = Collection.create({ user_id: 1, name: 'collection name' })
    expect(collection).to be_valid
  end

  it 'is invalid with empty name' do
  	collection = Collection.create({ user_id: 1, name: '' })
    expect(collection).to_not be_valid
  end

  it 'is invalid with not unique name and same user' do
  	collection_1 = Collection.create({ user_id: 1, name: 'collection name' })
  	collection_2 = Collection.create({ user_id: 1, name: 'collection name' })
  	expect(collection_1).to be_valid
    expect(collection_2).to_not be_valid
  end

  it 'is valid with unique name and not same user' do
  	collection_1 = Collection.create({ user_id: 1, name: 'collection name' })
  	collection_2 = Collection.create({ user_id: 2, name: 'collection name' })
  	expect(collection_1).to be_valid
    expect(collection_2).to be_valid
  end

end
