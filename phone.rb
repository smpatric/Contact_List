require_relative 'contact'

class Phone < ActiveRecord::Base
  belongs_to :contact
end