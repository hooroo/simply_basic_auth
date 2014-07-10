require_relative '../spec_helper'
require 'simply_basic_auth/yaml_reader'

module Rails
  def self.env
    'test'
  end
end

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

      before do
        expect(described_class).to receive(:users_file).and_return(users_file).at_least(1).times
      end

      after :suite do
        users_file.close
        users_file.unlink
      end

      it 'returns a hash of username keys to password values' do
        expect(described_class.users).to be_a Hash
        expect(described_class.users['test_username']).to eq('test_password')
      end
    end

  end
end
