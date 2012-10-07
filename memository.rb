require 'rubygems'
require 'sinatra'
require 'haml'
require 'grit'

get "/" do
  haml :index
end

post "/write" do
  pass = params['key']
  text = params['memo']
  @message = write_memo(pass, text)
  haml :index
end

get "/write/:text" do |param|
  pass, *text = param.split(/:/)
  text = text.join(":")
  write_memo(pass, text)
end

private
def write_memo(pass, text)
  memo_file = ".repository/memo"
  key = File.open(".key").read.chomp
  if pass == key
    File.open(memo_file, "a") {|f|
      f.puts text
    }
    repository = Grit::Repo.new(".git")
    repository.add(memo_file)
    repository.commit_index("write memo.")
    "done."
  else
    "Your not me..."
  end
end
