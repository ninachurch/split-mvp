require_relative '../../db/config'

class User < ActiveRecord::Base
  # UPCOMING FEATURE: Email validation!
  # validates :email, :uniqueness => true
  # validates_format_of :email, :with => /.+@\w+\.[a-zA-Z]{2,}/
  belongs_to :workout
  validates_format_of :phone, :with => /[0-9]{11}/

  def name
    [first_name, last_name].join(' ')
  end

  def make_workout
    "Hi #{self.name}! Time for a split! #{self.workout.a_qt / self.workout.splits} #{self.workout.a_workout }. #{self.workout.b_qt / self.workout.splits} #{self.workout.b_workout}. #{self.workout.c_qt / self.workout.splits} #{self.workout.c_workout}."
  end

  def self.add_user(user_info)
    User.create(user_info)
  end

end

# p User.first.make_workout



