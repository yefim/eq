require "sinatra"
require "mongo"
require "json/ext"

include Mongo

# http://stackoverflow.com/questions/8414395/verb-agnostic-matching-in-sinatra
def self.get_or_post(url,&block)
  get(url,&block)
  post(url,&block)
end

configure do
  conn = MongoClient.new('localhost', 27017)
  set :collection, conn['db']['eq']
end

before do
  headers['X-Frame-Options'] = 'GOFORIT'
end

get_or_post "/" do
  @eq = false
  @user = decrypt_key(params[:signed_request])
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

private

def decrypt_key(signed_request)
  parts = signed_request.split('.', 2)
  signature = parts[0]
  payload = parts[1]
  JSON.parse(Base64::decode64(payload))
end
