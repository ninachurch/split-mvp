require_relative '../../db/config'

class User < ActiveRecord::Base

  validates :email, :uniqueness => true
  validates_format_of :email, :with => /.+@\w+\.[a-zA-Z]{2,}/
  # validates_format_of :phone, :with => /.+\d{3}.+\d{3}.+\d{4}.+/
  # def initialize
  #   super
  #   @messages_sent = 0
  # end

  def name
    [first_name, last_name].join(' ')
  end

  def make_workout
  "Hi #{self.name}! Time for a split! #{self.a_qt / self.splits} #{self.a_workout}. #{self.b_qt / self.splits} #{self.b_workout}. #{self.c_qt / self.splits} #{self.c_workout}."
  end

end



