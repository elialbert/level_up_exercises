require 'bills_api'

class WelcomeController < ApplicationController
  def index
    puts "current user is #{current_user}"
    BillsAPI.repull_bills if (Date.today - Bill.get_latest_timestamp) > 6
  end
end
