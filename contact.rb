require_relative 'contact_database'
require 'pg'

class Contact
 
  attr_accessor :firstname,:lastname, :email, :id

  @@contacts = []
  @@db_connection = nil

  def initialize(firstname, lastname, email)
    # TODO: assign local variables to instance variables
    @id = nil
    @firstname = firstname
    @lastname = lastname
    @email = email
  end
 
  def save
    check = Contact.connect.exec_params('SELECT * FROM contacts WHERE email = $1', [@email])
    if check.ntuples == 0
      Contact.connect.exec_params('INSERT INTO contacts (firstname, lastname, email) 
      VALUES ($1, $2, $3)', [@firstname, @lastname, @email])
      puts "Contact added!"
    else
      puts "This contact exists already!"
    end
  end
 
  ## Class Methods
  class << self
    def connect
      @@db_connection ||= PG.connect(
        dbname: 'd7a3eod2r4ja7f',
        port: 5432,
        user: 'hvzvmtuzwvwzwx',
        host: 'ec2-107-22-253-198.compute-1.amazonaws.com',
        password: 'HmxmJY9xIpUjvabvoIbW8ZCvkD')
    end

    def close
      @@db_connection.close
    end

    def find(email)
      search = Contact.connect.exec_params('SELECT * FROM contacts WHERE email = $1', [email] )
      result = Contact.new(search[0]["firstname"], search[0]["lastname"], search[0]["email"])
      result.id = search[0]["id"]
      puts "ID: #{result.id}\nName: #{result.firstname} #{result.lastname}\nEmail: #{result.email}"
    end

    def find_all_by_lastname(name)
      results = []
      Contact.connect.exec_params('SELECT * FROM contacts WHERE lastname = $1', [name.downcase.capitalize!]) do |rows|
        rows.each do |row|
          new_contact = Contact.new(
            row['firstname'],
            row['lastname'],
            row['email'])
          new_contact.id = row['id']
          results << new_contact
        end
      end
      puts results.inspect
    end

     def find_all_by_firstname(name)
      results = []
      Contact.connect.exec_params('SELECT * FROM contacts WHERE firstname = $1', [name.downcase.capitalize!]) do |rows|
        rows.each do |row|
          new_contact = Contact.new(
            row['firstname'],
            row['lastname'],
            row['email'])
          new_contact.id = row['id']
          results << new_contact
        end
      end
      puts results.inspect
    end

    def update(id)
      search = Contact.connect.exec_params('SELECT * FROM contacts WHERE id = $1', [id])
      result = Contact.new(search[0]["firstname"], search[0]["lastname"], search[0]["email"])
      result.id = search[0]["id"]
      puts "Please enter the new First Name"
      new_fname = gets.chomp
      puts "Please enter the new Last Name"
      new_lname = gets.chomp
      puts "Please enter the new Email"
      new_email = gets.chomp
      Contact.connect.exec_params('UPDATE contacts SET firstname = $2, lastname = $3, email = $4 WHERE id = $1', [result.id, new_fname, new_lname, new_email])
      puts "Contact Updated!"
    end
  end
end