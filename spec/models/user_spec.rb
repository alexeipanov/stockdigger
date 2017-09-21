require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
  	user = User.create({ name: 'Test', email: 'rspec@gmail.com', password: '456789', password_confirmation: '456789' })
    expect(user).to be_valid
  end

  it 'is invalid with empty name' do
  	user = User.create({ name: nil, email: 'rspec@gmail.com', password: '456789', password_confirmation: '456789' })
    expect(user).to_not be_valid
  end

  it 'is invalid with empty email' do
  	user = User.create({ name: 'Test', email: nil, password: '456789', password_confirmation: '456789' })
    expect(user).to_not be_valid
  end

  it 'is invalid with non unique email' do
  	user_1 = User.create({ name: 'Test', email: 'rspec@gmail.com', password: '456789', password_confirmation: '456789' })
  	user_2 = User.create({ name: 'Test', email: 'rspec@gmail.com', password: '456789', password_confirmation: '456789' })
  	expect(user_1).to be_valid
    expect(user_2).to_not be_valid
  end

  it 'is invalid with password length < 6' do
  	user = User.create({ name: 'Test', email: 'rspec@gmail.com', password: '45678', password_confirmation: '45678' })
    expect(user).to_not be_valid
  end

  it 'is invalid with empty password_confirmation' do
  	user = User.create({ name: 'Test', email: 'rspec@gmail.com', password: '456789', password_confirmation: nil })
    expect(user).to_not be_valid
  end

  it 'is invalid with password and password_confirmation not same' do
  	user = User.create({ name: 'Test', email: 'rspec@gmail.com', password: '456789', password_confirmation: '456780' })
    expect(user).to_not be_valid
  end

end
