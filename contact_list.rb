require_relative 'contact'
require_relative 'contact_database'


#contacts = CSV.read('contacts.csv')

@input = ARGV.shift

def help_menu
  puts "Here is a list of available commands:"
  puts "new - Create a new contact\nupdate - Update an existing contact\nfind - Find a contact" 
end

def input
  if @input == "help"
    help_menu
  elsif @input == "new"
    puts "What's the contact's first name?"
    f_name = gets.chomp
    puts "What's the contact's lastn name?"
    l_name = gets.chomp
    puts "What's the contact's email?"
    email = gets.chomp
    Contact.new(f_name, l_name, email).save
  elsif @input == "update"
    puts "What contact ID would you like to update?"
    id = gets.chomp
    Contact.update(id)
  elsif @input == "find"
    puts "Would you like to search by First Name, Last Name, or Email?"
    answer = gets.chomp.downcase
    if answer == "first name"
      puts "What is the contact's First Name?"
      name = gets.chomp
      Contact.find_all_by_firstname(name)
    elsif answer == "last name"
      puts "What is the contact's Last Name?"
      name = gets.chomp
      Contact.find_all_by_lastname(name)
    else 
      puts "What is the contact's Email?"
      email = gets.chomp
      Contact.find(email)
    end
  end
end  

input 
    


