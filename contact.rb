class Contact
 
  attr_accessor :name, :email

  @@temp_contacts = []

  def initialize(name, email)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
  end
 
  def to_s
    # TODO: return string representation of Contact
    puts "Name: #{@name}, Email: #{@email}"
  end
 
  ## Class Methods
  class << self
    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      new_contact = Contact.new(name, email)
      CSV.open('contacts.csv', 'a') do |file|
        file << [new_contact.name, new_contact.email]
      end
    end
 
    def find(name)
      # TODO: Will find and return contact by name
      CSV.foreach('contacts.csv') do |row|
        @@temp_contacts << row
      end
      puts @@temp_contacts.include?(.*name.*)
    end
 
    def all 
      CSV.foreach('contacts.csv') do |row|
        @@temp_contacts << row
      end
      @@temp_contacts.each_with_index do |record, index|
        puts "ID: #{index} - #{record}"
      end
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
    end
    
  end
 
end