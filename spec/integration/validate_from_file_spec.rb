require_relative '../spec_helper'
require 'simply_basic_auth/yaml_reader'
require 'simply_basic_auth/user_validator'

describe 'User validation from file' do
  let(:file_contents) do
    %q{---
context:
  correct_username: correct_password
    }
  end

  let(:users_file) do
    Tempfile.new('users_file').tap do |file|
      file.write(file_contents)
      file.rewind
    end
  end

  let(:harness_class) do
    Class.new do
      include SimplyBasicAuth::YamlReader
      include SimplyBasicAuth::UserValidator
    end
  end


  subject { harness_class.new }

  before do
    SimplyBasicAuth.configure do |config|
      config.users_file = users_file.path
    end
  end

  after :suite do
    users_file.close
    users_file.unlink
  end

  context 'given the correct context' do
    let(:users_context) { 'context' }
    context 'given correct user details' do
      let(:username) { 'correct_username' }
      let(:password) { 'correct_password' }

      it 'returns true' do
        expect(subject.valid_user?(username, password, users_context)).to be true
      end
    end

    context 'given incorrect user details' do
      let(:username) { 'incorrect_username' }
      let(:password) { 'incorrect_password' }
      let(:users_context) { 'context' }

      it 'returns true' do
        expect(subject.valid_user?(username, password, users_context)).to be false
      end
    end
  end

  context 'given an incorrect context' do
    let(:users_context) { 'bad_context' }
    let(:username) { 'foo' }
    let(:password) { 'bar' }

    it 'returns false' do
      expect(subject.valid_user?(username, password, users_context)).to be false
    end
  end
end
