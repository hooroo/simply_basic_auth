require_relative '../../spec_helper'
require 'simply_basic_auth/rack/http_authenticator'
require 'rack/test'


module SimplyBasicAuth
  module Rack
    describe HttpAuthenticator do
      include ::Rack::Test::Methods

      let(:app) do
        ::Rack::Builder.new do
          require 'simply_basic_auth/rack/http_authenticator'
          application = Class.new do
            def call(env)
              [200, {}, ['OK']]
            end
          end

          use SimplyBasicAuth::Rack::HttpAuthenticator
          run application.new
        end
      end

      let(:username) { 'username' }
      let(:password) { 'password' }

      let(:users_hash) do
        {
          'test' => {
            username => password
          }
        }
      end

      before do
        allow(File).to receive(:read).and_return(users_hash.to_yaml)
        basic_authorize(check_username, check_password)
        get '/'
      end

      context 'with invalid user credentials' do
        context 'where the password is incorrect' do
          let(:check_username) { username }
          let(:check_password) { 'notcorrectpassword' }

          it 'responds with an authentication error' do
            expect(last_response).to be_unauthorized
          end
        end

        context 'where the username is incorrect' do
          let(:check_username) { 'notcorrectusername' }
          let(:check_password) { password }

          it 'responds with an authentication error' do
            expect(last_response).to be_unauthorized
          end
        end
      end

      context 'with valid user credentials' do
        let(:check_username) { username }
        let(:check_password) { password }

        it 'allows the application to respond' do
          expect(last_response).to be_ok
        end
      end

    end
  end
end