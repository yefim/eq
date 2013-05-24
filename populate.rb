require "mongo"

include Mongo

@conn = MongoClient.new('localhost', 27017)
@collection = conn['db']['eq']
