require 'rubygems'
require 'sinatra'
require '../db/config.rb'
require_relative './models/user'
require_relative './models/workout'


# get '/hello' do
#     user = User.first
#     name = user.first_name
#     @string_name = name.to_s
#   # "Hello " + string_name + "!"
#   erb :welcome
# end

get '/' do
  # @user = User.create(params)
  erb :index
end

post "/new" do
  @user = User.create(params)
  redirect '/welcome'
end

get '/welcome' do
  erb :welcome
end

# get '/' do
#   @user = User.create("created_at DESC")
#   redirect "/new" if @user.empty?
#   erb :index
#     # @signed_up = is_following?(@user1, @user2)  erb :follows
# end


