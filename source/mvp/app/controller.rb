require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'
require 'sinatra'
require 'rufus-scheduler'
require_relative './models/user'
require_relative './models/workout'
require_relative 'twilio_module'
require_relative '../db/workouts'
require_relative '../db/config.rb'


scheduler = Rufus::Scheduler.new
scheduler.every '10s' do
  User.all.each do |person|
    unless person.message_counter >= 3
      Messenger.send(person.phone, person.make_workout)
      updated_counter = person.message_counter += 1
      person.update_attribute(:message_counter, updated_counter)
    end
  end
end



