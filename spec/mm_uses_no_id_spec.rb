require File.expand_path('../../lib/mm_uses_no_id', __FILE__)

describe MmUsesNoId do
  
  before(:all) do
    require 'mongo_mapper'
    
    class Group
      include MongoMapper::Document
      many :people, :class_name => 'Person'
    end
    
    class Person
      include MongoMapper::EmbeddedDocument
      plugin  MmUsesNoId
      
      key :name
      key :age
    end
    
    @group  = Group.new
    @person = Person.new(name: 'Jon', age: 33) 
  end 
  
  it "a new embedded document should have no _id field" do
    @person.attributes.keys.should_not include('_id')
  end

  it "it should be possible to embed an id-less document inside a regular document" do
    @group.people << @person
    @group.people.should include(@person)
  end
end