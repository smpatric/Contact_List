require_relative 'contact'
require_relative 'phone'
require_relative 'contact_database'


#Contact.create(firstname: 'Armanti', lastname: 'Edwards', email: 'appstatewaaa@gmail.com')


@input = ARGV.shift

def help_menu
  puts "Here is a list of available commands:"
  puts "new - Create a new contact\nadd - Add a phone number\nlist - List all contacts\nfind - Find a contact" 
end

def input
  if @input == "help"
    help_menu
  elsif @input == "new"
    puts "What's the contact's first name?"
    f_name = gets.chomp
    puts "What's the contact's last name?"
    l_name = gets.chomp
    puts "What's the contact's email?"
    email = gets.chomp
    Contact.create(firstname: f_name, lastname: l_name, email: email)
  elsif @input == "add"
    puts "What user ID would you like to add a phone to?"
    id = gets.chomp
    puts "What type of number is this?"
    label = gets.chomp.downcase.capitalize
    puts "What is the number?"
    number = gets.chomp
    Phone.create(contact_id: id, label: label, phone_number: number)
  elsif @input == "list"
    puts Contact.all.inspect
  elsif @input == "find"
    puts "Would you like to search by First Name, Last Name, or ID?"
    answer = gets.chomp.downcase
    if answer == "first name"
      puts "What is the contact's First Name?"
      name = gets.chomp.downcase.capitalize
      puts Contact.where(firstname: name).inspect
    elsif answer == "last name"
      puts "What is the contact's Last Name?"
      name = gets.chomp.downcase.capitalize
      puts Contact.where(lastname: name).inspect
    else 
      puts "What is the contact's ID?"
      id = gets.chomp
      puts Contact.find(id).inspect
    end
  end
end  

input 
    


