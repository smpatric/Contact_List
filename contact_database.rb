## TODO: Implement CSV reading/writing
require 'csv'
require_relative 'contact'

class ContactDatabase

  @@temp_contacts = []

  class << self
    def read_db
      @@temp_contacts = CSV.read('contacts.csv')
      return @@temp_contacts
    end
  end
end