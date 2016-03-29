require "active_record"
require "yaml"
require "pry"

require "databasics/version"
require "databasics/user"
require "databasics/address"
require "databasics/item"
require "databasics/order"

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
      new_user=User.find_by_create_by(first_name: first_name,last_name: last_name,
      email: email)
      new_user.save
      puts "Your id is #{new_user.id}"
    end

    def display_users_current_addresses
      puts "Last name of user address looking for"
      last_name = gets.chomp.to_s
      user_address= Address.find_by(user_id: user.id)
      #or address = Address.where(user_id: user,id)
      current_address= user_address.last
      user_address.each do |address|
      puts "Address: #{{address.street}}, #{address.state},#{address.city},
      #{address.zip}"
      #probably by using client = Client.last for this one
    end

    def user_order_history
#items bought and quantity
      puts "What is your ID?"
      user_id = gets.chomp
      #user = User.find(user_id)
      orders = Order.where(user_id: user_id)
      orders.each do |order|
        item = Item.find(order.item_id)
        puts "You ordered #{order.quantity} #{item.title.pluralize}"
      end
# Better way use a .includes() association method:
#   Order.includes(:items).where(user_id:user.id).each do |order\
#   puts "You ordered #{order.quantity} #{order.item.title.pluralize}"
#
    end

    def new_order
      puts "What would you like to purchase?"
      item = gets.chomp.to_s
      #prompt for item name match the id, ask for quantity
      puts "How many would you like"
      quantity = gets.chomp.to_i
      new_order = Order.create_by (item_id: item.id, quantity: quantity)
      #place new order
      puts new_order
      #return message if item not found probably use find_by!

    end
  end
  ## 3 ActiveRecord querying methods
  # 1) Model.where
  # 2) Model.find
  # 3) Model.find_by
end

app = Databasics::App.new
app.create_new_user
app.display_users_current_addresses
app.user_order_history
app.new_order
