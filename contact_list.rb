require_relative 'contact'
require_relative 'contact_database'


contacts = CSV.read('contacts.csv')

@input = ARGV.shift

def help_menu
  puts "Here is a list of available commands:"
  puts "new - Create a new contact\nlist - List all contacts\nshow - Show a contact\nfind - Find a contact" 
end

def input
  if @input == "help"
    help_menu
  elsif @input == "new"
    puts "What's the contact name?"
    name = gets.chomp
    puts "What's the contact Email?"
    email = gets.chomp
    Contact.create(name, email)
    #call create method on Contact
  elsif @input == "list"
    Contact.all
    #call all method on Contact
  elsif @input == "show"
    # call show method on Contact
  elsif @input == "find"
    puts "Who are you searching for?"
    name = gets.chome
    Contact.find(name.to_s.downcase)
    #call find method on Contact
  end
end  

input 
    


