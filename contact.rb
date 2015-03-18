require_relative 'contact_database'
require 'active_record'
require 'pg'


class Contact < ActiveRecord::Base 
  has_many :phones
end

