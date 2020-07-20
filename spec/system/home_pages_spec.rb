require 'rails_helper'

RSpec.describe "HomePages" do
  before do
    driven_by(:rack_test)

    visit root_path
  end

  it 'shows the home link' do
    expecting = page.has_link?('TwitterClone')

    expect(expecting).to be true
  end

  context 'when no user sign in' do
    it 'shows the Log In link' do
      expecting = page.has_link?('Log In')

      expect(expecting).to be true
    end

    it 'shows the Sign Up link' do
      expecting = page.has_link?('Sign Up')

      expect(expecting).to be true
    end
  end

  context 'when user is logged in' do
    before do
      log_in(create(:user))
      visit root_path
    end

    it 'shows the New Tweet link' do
      expecting = page.has_link?('New Tweet')

      expect(expecting).to be true
    end

    it 'shows the Log Out link' do
      expecting = page.has_link?('Log Out')

      expect(expecting).to be true
    end

    it 'shows the name from user' do
      tweet = create(:tweet)

      visit root_path

      expecting = page.has_content?('Goce')

      expect(expecting).to be true
    end
  end

  context 'when an tweet is present' do
    let!(:tweet) { create(:tweet, content: 'Testing') }

    before do
      visit root_path
    end

    it 'shows the tweet content' do
      expecting = page.has_content?(tweet.content)

      expect(expecting).to be true
    end
  end
end
