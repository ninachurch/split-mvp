require 'rubygems'
require 'rspec'
require File.expand_path('../app/controller')

describe "User Class:" do
  describe "Verify that first user in database" do
  it "is Yohan" do
    User.find(1).first_name.should eql("Yohan")
  end
end

  describe "Verify that the last user in database" do
    it "is Cassidy" do
      cassidy = User.add_user({first_name: "Cassidy", last_name: "Clawson", phone: "18312473750"}, $brick_workout)
      cassidy.should eql(User.last)
    end
  end
end
