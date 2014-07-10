require_relative '../spec_helper'
require 'simply_basic_auth/user_validator'


module SimplyBasicAuth

  module Testing
    class Harness
      include SimplyBasicAuth::UserValidator

      def initialize(users)
        @users = users
      end

      def users
        @users
      end
    end
  end
  describe UserValidator do

    describe '#valid_user?' do
      let(:correct_username) { 'correct_username' }
      let(:correct_password) { 'correct_password' }
      let!(:user_hash) do
        {
          correct_username => correct_password
        }
      end

      let(:implementation) do
        Testing::Harness.new(user_hash)
      end

      let(:username) { nil }
      let(:password) { nil }

      context 'with correct credentials' do
        let(:username) { correct_username }
        let(:password) { correct_password }
        it 'returns true' do
          expect(implementation.valid_user?(username, password)).to be true
        end
      end

      context 'with incorrect credentials' do
        let(:username) { 'incorrect_username' }
        let(:password) { 'incorrect_password' }
        it 'returns true' do
          expect(implementation.valid_user?(username, password)).to be false
        end
      end
    end

  end
end
