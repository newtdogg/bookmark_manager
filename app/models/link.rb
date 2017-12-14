require 'data_mapper'
require 'dm-postgres-adapter'
# Link class
class Link
  include DataMapper::Resource
  # many to many
  has n, :tags, through: Resource

  property :id, Serial
  property :title, String
  property :url, String
end
