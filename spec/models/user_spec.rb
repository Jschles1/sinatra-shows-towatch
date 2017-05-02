require_relative '../spec_helper'

describe User do
  it 'has a username and password' do
    user = build(:user)

    expect(user).to be_valid
  end

  it 'is invalid without a username' do
    user = build(:user, username: nil)

    expect(user).to_not be_valid
  end

  it 'is invalid without a password' do
    user = build(:user, password: nil)

    expect(user).to_not be_valid
  end

  it 'is invalid without a unique username' do
    user = create(:user)
    user2 = build(:user, username: 'Jschles1', password: 'password2')

    expect(user2).to_not be_valid
  end



end
