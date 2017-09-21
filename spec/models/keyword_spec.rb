require 'rails_helper'

RSpec.describe Keyword, type: :model do

  it 'is valid with valid attributes' do
  	keyword = Keyword.create({ collection_id: 1, keyword: 'keyword' })
    expect(keyword).to be_valid
  end

  it 'is invalid with empty keyword' do
  	keyword = Keyword.create({ collection_id: 1, keyword: nil })
    expect(keyword).to_not be_valid
  end

  it 'is invalid with not unique keyword and same collection' do
  	keyword_1 = Keyword.create({ collection_id: 1, keyword: 'keyword' })
  	keyword_2 = Keyword.create({ collection_id: 1, keyword: 'keyword' })
  	expect(keyword_1).to be_valid
    expect(keyword_2).to_not be_valid
  end

  it 'is valid with unique keyword and not same user' do
  	keyword_1 = Keyword.create({ collection_id: 1, keyword: 'keyword' })
  	keyword_2 = Keyword.create({ collection_id: 2, keyword: 'keyword' })
  	expect(keyword_1).to be_valid
    expect(keyword_2).to be_valid
  end
end
