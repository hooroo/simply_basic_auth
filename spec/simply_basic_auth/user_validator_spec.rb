require_relative '../spec_helper'
require 'simply_basic_auth/user_validator'


module SimplyBasicAuth
  describe UserValidator do

    describe '#valid_user?' do
      let(:correct_username) { 'correct_username' }
      let(:correct_password) { 'correct_password' }
      let!(:user_hash) do
        {
          correct_username => correct_password
        }
      end
      let(:implementation_class) do
        Class.new do
          include SimplyBasicAuth::UserValidator

          def initialize(users)
            @users = users
          end

          def users(environment)
            @users
          end
        end
      end

      let(:implementation) do
        implementation_class.new(user_hash)
      end

      let(:username) { nil }
      let(:password) { nil }

      context 'with correct credentials' do
        let(:username) { correct_username }
        let(:password) { correct_password }
        it 'returns true' do
          expect(implementation.valid_user?(username, password, nil)).to be true
        end
      end

      context 'with incorrect credentials' do
        let(:username) { 'incorrect_username' }
        let(:password) { 'incorrect_password' }
        it 'returns true' do
          expect(implementation.valid_user?(username, password, nil)).to be false
        end
      end
    end

  end
end
