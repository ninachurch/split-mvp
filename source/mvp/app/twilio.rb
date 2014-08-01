require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'
require 'sinatra'
require 'rufus-scheduler'
require_relative './models/user'

# get '/twilio' do
# end
# This creates a persistent state and prepares us for listening for inbound messages when we advance past the MVP (via Sinatra).

scheduler = Rufus::Scheduler.new

module Messenger
  account_sid = 'AC56bb621c25fa4c5967c7977d7c24287a'
  auth_token = 'cc017f1620198252af6bdbe189e501b7'
  @client = Twilio::REST::Client.new account_sid, auth_token

  # Master message sending method.
  def self.send(number, message_string)
      @client.account.messages.create({
        :from => '+14156926259',
        :to => number,
        :body => message_string
      })
  end

  # Provides a print out of all message activity for debugging.
  def self.messages
    @client.account.messages.list.to_enum.each do |message|
      puts "Direction: #{message.direction}. To: #{message.to}. Status: #{message.status}. Body: #{message.body}"
    end
  end

end

# === CONTROLLER ===
scheduler.every '20s' do
  User.all.each do |person|
    unless person.message_counter >= 3
      Messenger.send(person.phone, person.make_workout)
      updated_counter = person.message_counter += 1
      person.update_attribute(:message_counter, updated_counter)
    end
  end
end
