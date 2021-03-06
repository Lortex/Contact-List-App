class Contact
 
  attr_accessor :name, :email

  def initialize(name, email, id)
    @name = name
    @email = email 
    @id = id
    @contact_list = []
  end
 
  def to_s
    # TODO: return string representation of Contact
    "Name: #{@name}, Email: #{@email}, ID#: #{id}"
  end
 
  ## Class Methods
  class << self
    def create(name, email, numbers = nil)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      # Could seperate this method into a few others for clarity and Single Res P
      id = ContactDatabase.add(name, email, numbers)
      Contact.new(name, email, id)
      return id
    end
 
    def find(term)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
      ContactDatabase.find(term)  
    end

     
    def all
      # TODO: Return the list of contacts, as is
            #student note. My list ID starts from 0. this is easily remedied but right now its 0
      @contact_list = ContactDatabase.list
      puts @contact_list
    end
    
    def show(id)
      # TODO: Show a contact, based on ID 
      ContactDatabase.show(id)
    end
   

      #functionally the same as all 
    def list
      ContactDatabase.list
    end

    def save

    end
    
  end
 
end

# Contact.create('123', 'Wilson', 'wilsdog@gmail')
