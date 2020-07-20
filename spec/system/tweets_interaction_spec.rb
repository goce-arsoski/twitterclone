require 'rails_helper'

RSpec.describe "TweetsInteraction" do
  let(:user) { create(:user) }
  let(:tweet) { create(:tweet, user: user) }

  before do
    driven_by :rack_test

    log_in(user)
  end

  describe 'Creating a tweet' do
    it 'creates and shows a newly created tweet' do
      content = 'New tweet!'

      click_on 'New Tweet'

      within 'form' do
        fill_in 'Content', with: content

        click_on 'Post Tweet'
      end

      expecting = page.has_content?(content)

      expect(expecting).to be true
    end
  end

  describe 'Editing a tweet' do
    it 'edits and shows the tweet' do
      content = 'Edit tweet'
      visit tweet_path(tweet)

      find(:css, 'i.fas.fa-edit').click
      visit edit_tweet_path(tweet)
      expect(page).to have_current_path(edit_tweet_path(tweet))

      within 'form' do
        fill_in "Content", with: content

        click_on 'Update Tweet'
      end

      visit tweet_path(tweet)
      expecting = page.has_content?(content)

      expect(expecting).to be true
    end
  end

  describe 'Deleting a tweet' do

  end

  describe 'Creating new tweet comments' do

  end
end
