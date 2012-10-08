# encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'haml'
require 'MeCab'
require 'mecab-mora'

get "/" do
  haml :index
end

post "/count" do
  text = params['text']
  @message = "#{text}: #{mora_count(text)}拍"
  haml :index
end

get "/count/:text" do |text|
  mora_count(text)
end

private
def mora_count(text)
  MeCab::Mora.new(text).count
end
