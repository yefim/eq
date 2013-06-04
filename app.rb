require "sinatra"
require "mongo"
require "json/ext"

include Mongo

configure do
  conn = MongoClient.new('localhost', 27017)
  set :collection, conn['db']['eq']
end

post "/" do
  @eq = false
  headers['X-Frame-Options'] = 'GOFORIT'
  erb :index
end

get "/" do
  @eq = false
  headers['X-Frame-Options'] = 'GOFORIT'
  erb :index
end

post "/results" do
  a = params["answers"]
  questions = settings.collection.find().to_a

  # score
  p a
  content_type :json
  params
end

get "/:page" do |page|
  @eq = true
  @questions = settings.collection.find().to_a
  erb :eq
end
