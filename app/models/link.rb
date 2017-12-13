# Link class
class Link
  include DataMapper::Resource
  # many to many relationship
  has n, :tags, through: Resource

  property :id, Serial
  property :title, String
  property :url, String
end
