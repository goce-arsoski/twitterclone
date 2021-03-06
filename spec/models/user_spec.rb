require 'rails_helper'

RSpec.describe User do
  context "when saving" do
    it "transform email to lower case" do
      goce = create(:user, email: 'GOCE.ARSOSKI@gmail.com')

      expect(goce.email).to eq 'goce.arsoski@gmail.com'
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:tweets) }
    it { is_expected.to have_many(:comments) }

    describe 'dependent' do
      let(:tweets_count) { 1 }
      let(:comments_count) { 1 }
      let(:user) { create(:user) }

      it 'destroy tweets' do
        create_list(:tweet, tweets_count, user: user)

        expect { user.destroy }.to change { Tweet.count }.by(-tweets_count)
      end

      it 'destroy comments' do
        create_list(:comment, comments_count, user: user)

        expect { user.destroy }.to change { Comment.count }.by(-comments_count)
      end
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }

    it { is_expected.to have_secure_password }

    context 'when using uniqueness of email' do
      subject { create(:user) }

      it { is_expected.to validate_uniqueness_of(:email) }
    end

    it { is_expected.to validate_length_of(:password).is_at_least(User::MIN_PASSWORD_LENGTH) }
    it { is_expected.to validate_length_of(:name).is_at_most(User::MAX_NAME_LENGTH) }
    it { is_expected.to validate_length_of(:email).is_at_most(User::MAX_EMAIL_LENGTH) }
  end

  context 'when using invalid email format' do
    it 'is invalid' do
      goce = build(:user, email: 'goce.arsoskigmail.com')

      expect(goce.valid?).to be false
    end
  end
end
