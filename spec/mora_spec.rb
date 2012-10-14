# encoding: utf-8
require 'rspec'
require 'rack/test'

MY_APP = Rack::Builder.parse_file('config.ru').first

include Rack::Test::Methods
def app
  MY_APP
end

describe "mora-web" do
  context "root" do
    it "last response ok?" do
      get '/'
      last_response.ok? == true
    end
  end

  context "count" do
    it "last response ok?" do
      post '/convert'
      last_response.ok? == true
    end

    it "hiragana mora" do
      post '/count', {"text" => "あいうえお"}
      last_response.ok? == true
      last_response.body.to_s.should =~ /あいうえお: 5拍/
    end
  end
end

