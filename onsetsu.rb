# encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'haml'
require 'MeCab'
require 'mecab-syllable'

get "/" do
  haml :index
end

post "/count" do
  text = params['text']
  @message = "#{text}: #{syllable_count(text)}音"
  haml :index
end

get "/count/:text" do |text|
  syllable_count(text)
end

private
def syllable_count(text)
  MeCab::Syllable.new(text).count
end
