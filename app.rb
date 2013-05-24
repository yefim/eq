require "sinatra"
require "mongo"
require "json/ext"

include Mongo

configure do
  conn = MongoClient.new('localhost', 27017)
  set :collection, conn['db']['eq']
end

get "/" do
  erb :index
end

get "/questions/:page" do |page|
  content_type :json
  settings.collection.find(page: page).to_a.to_json
end
