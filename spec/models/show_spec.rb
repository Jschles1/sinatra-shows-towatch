require_relative '../spec_helper'

describe Show do
  it 'has a name, network, weekday and showtime' do
    show = build(:show)

    expect(show).to be_valid
  end

  it 'is invalid without a name' do
    show = build(:show, name: nil)

    expect(show).to_not be_valid
  end

  it 'is invalid without a network' do
    show = build(:show, network: nil)

    expect(show).to_not be_valid
  end

  it 'is invalid without a weekday' do
    show = build(:show, weekday: nil)

    expect(show).to_not be_valid
  end

  it 'is invalid without a showtime' do
    show = build(:show, showtime: nil)

    expect(show).to_not be_valid
  end

  describe 'associations' do
    before(:each) do
      @user = create(:user)
      @show = create(:show)
      @show.user = @user
    end

    it 'belongs to a user' do
      expect(@show.user.username).to eq("Jschles1")
    end
  end
end