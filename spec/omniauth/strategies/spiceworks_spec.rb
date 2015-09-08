require 'spec_helper'
require 'omniauth-spiceworks'

describe OmniAuth::Strategies::Spiceworks do
  let(:request) { double('Request', :params => {}, :cookies => {}, :env => {}) }
  let(:app) {
    lambda do
      [200, {}, ["Hello."]]
    end
  }
  subject do
    OmniAuth::Strategies::Spiceworks.new(app, 'appid', 'secret', @options || {}).tap do |strategy|
      allow(strategy).to receive(:request) {
        request
      }
    end
  end

  describe '#authorize_params' do
    it 'has default scope' do
      @options = {scope: 'email'}
      puts "***SUBJECT #{subject.authorize_params}"
      expect(subject.authorize_params[:scope]).to eq 'default'
    end
  end

  describe '#client_options' do
    it 'has correct site' do
      expect(subject.client.site).to eq('https://accounts.spiceworks.com')
    end
  end

  describe '#extra' do
    describe 'raw_info' do
      it 'should have raw information gathered from a server call' do
        stub_access_token
        expect(subject.extra).to include('raw_info' => raw_info)
      end
    end
  end

  describe '#uid' do
    it 'should get the uid from raw info' do
      stub_access_token
      expect(subject.uid).to eq(subject.extra['raw_info']['spiceworks_id'])
    end
  end

  def stub_access_token
    allow(subject).to receive(:access_token).and_return(access_token)
  end

  def access_token
    OAuth2::AccessToken.from_hash(client, {})
  end

  def client
    OAuth2::Client.new('abc', 'def') do |builder|
      builder.adapter :test do |stub|
        stub.get('/api/public/v1/users/user') {|env| [200, {'content-type' => 'application/json'}, {'user': raw_info}.to_json]}
      end
    end
  end

  def raw_info
    {
      first_name: 'Test',
      last_name: 'Tester',
      spiceworks_id: 1,
      email: 'test@test.com'
    }.to_json
  end
end
