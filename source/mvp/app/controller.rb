require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'
require 'sinatra'
require 'rufus-scheduler'
require_relative './models/user'
require_relative 'twilio_module'
require_relative '../db/workouts'

scheduler = Rufus::Scheduler.new
scheduler.every '60s' do
  User.all.each do |person|
    unless person.message_counter >= person.splits
      Messenger.send(person.phone, person.make_workout)
      updated_counter = person.message_counter += 1
      person.update_attribute(:message_counter, updated_counter)
    end
  end
end



