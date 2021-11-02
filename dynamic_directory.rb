require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "find"

PUBLIC_PATH = 'public'

get "/" do
  @files = []
  Find.find(PUBLIC_PATH) do |path|
    next unless File.file?(path)
    @files << path[(PUBLIC_PATH.length + 1)..-1]
  end
  @files.reverse! if params[:sort] == "descending"
  erb :home
end