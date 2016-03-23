require "active_record"
require "yaml"
require "pry"

require "databasics/version"
require "databasics/user"
require "databasics/address"
require "databasics/items"
require "databasics/orders"

db_config = YAML.load(File.open("config/database.yml"))
ActiveRecord::Base.establish_connection(db_config)

module Databasics
  class App < ActiveRecord::Base
    def create_new_user
      puts "What is your first name"
      first_name = gets.chomp.to_s
      puts "What is your last name"
      last_name gets.chomp.to_s
      puts "Whats your email"
      email = gets.chomp.to_s
      new_user=User.find_or_create_by(first_name: first_name,last_name: last_name
      email: email)
      new_user.save
      binding.pry
    end

    def display_users_current_address
      #probably by using client = Client.last for this one
    end

    def user_order_history
#items bought and quantity
    end

    def new_order
      #prompt for item name, quantity
      #place new order
      #return message if item not found probably use find_by!
    end
  ## 3 ActiveRecord querying methods
  # 1) Model.where
  # 2) Model.find
  # 3) Model.find_by
end

app = Databasics::App.new
app.create_new_user
app.display_users_current_address
app.user_order_history
app.new_order
