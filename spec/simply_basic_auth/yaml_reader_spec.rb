require_relative '../spec_helper'
require 'simply_basic_auth/yaml_reader'

module SimplyBasicAuth

  describe YamlReader do

    describe '.users' do
      let(:file_contents) do
        %q{---
test:
  test_username: test_password
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
        end
      end

      subject { harness_class.new }

      before do
        expect(subject).to receive(:users_file).and_return(users_file).at_least(1).times
      end

      after :suite do
        users_file.close
        users_file.unlink
      end

      context 'when given a valid context' do
        let(:users_context) { 'test' }
        it 'returns a hash of username keys to password values' do
          expect(subject.users(users_context)).to be_a Hash
          expect(subject.users(users_context)['test_username']).to eq('test_password')
        end
      end
    end

  end
end
