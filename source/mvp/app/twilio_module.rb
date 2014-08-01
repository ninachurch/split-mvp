require 'twilio-ruby'

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
