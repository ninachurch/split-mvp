require_relative '../../db/config'

class Workout < ActiveRecord::Base
  has_many :users
end



