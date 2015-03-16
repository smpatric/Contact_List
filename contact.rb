require_relative 'contact_database'
class Contact
 
  attr_accessor :name, :email

  @@contacts = []

  def initialize(name, email)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
  end
 
  def to_s
    # TODO: return string representation of Contact
    "#{@name}, #{@email}"
  end
 
  ## Class Methods
  class << self
    def no_dupes(email)
      ContactDatabase.read_db.each do |name, email|
        @@contacts << Contact.new(name, email)
      end
      dupes = @@contacts.select { |contact| (contact.email.include? email) }
      dupes.length > 0 ? true : false
    end

    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      new_contact = Contact.new(name, email)
      CSV.open('contacts.csv', 'a') do |file|
        file << [new_contact.name, new_contact.email]
      end
    end
 
    def find(name)
      # TODO: Will find and return contact by name
      ContactDatabase.read_db.each do |name, email|
        @@contacts << Contact.new(name, email)
      end
      puts @@contacts.select { |contact| (contact.name.downcase.include? name) || (contact.email.downcase.include? name)}
    end

    def all 
      ContactDatabase.read_db.each do |name, email|
        @@contacts << Contact.new(name, email)
      end
      @@contacts.each_with_index { |record, index| puts "#{index} : #{record}"}
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
       ContactDatabase.read_db.each do |name, email|
        @@contacts << Contact.new(name, email)
      end
      puts @@contacts[id]
    end
  end
end