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
    end

    def display_users_current_address
    end

    def user_order_history
#items bought and quantity
    end

    def new_order
      #prompt for item name, quantity
      #place new order
      #return message if item not found
    end
  end

  # Your code goes here...

  ## 3 ActiveRecord querying methods
  # 1) Model.where
  # 2) Model.find
  # 3) Model.find_by
end
