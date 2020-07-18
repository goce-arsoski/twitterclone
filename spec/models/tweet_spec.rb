require 'rails_helper'

RSpec.describe Tweet do
  describe 'associations' do
    it { is_expected.to have_many(:comments) }
    it { is_expected.to belong_to(:user) }

    describe 'dependent' do
      let(:comments_count) { 1 }
      let(:user) { create(:user) }

      it 'destroy comments' do
        create_list(:comment, comments_count, user: user)

        expect { user.destroy }.to change { Comment.count }.by(-comments_count)
      end
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_length_of(:content).is_at_most(Tweet::MAX_CONTENT_LENGTH) }
  end
end
