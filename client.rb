require 'json'
require 'rest-client'

class UnoClient
  attr_reader :name
  attr_accessor :remote_server

  def initialize name
    @name = name
    @remote_server = remote_server
  end

  def join_game
    response = RestClient.post "#{ @remote_server }/api/join", :data => {name: @name}.to_json, :accept => :json
    puts JSON.parse(response,:symbolize_names => true)
  end

  def get_cards
    response = RestClient.get "#{ @remote_server }/api/cards", {:params => {:name => @name}}
    puts response
  end

  def deal
    response = RestClient.post "#{ @remote_server }/api/deal", :data =>{}.to_json, :accept => :json
    puts response
  end

end




bob_uno = UnoClient.new 'bob'
carol_uno = UnoClient.new 'carol'
ted_uno = UnoClient.new 'ted'
alice_uno = UnoClient.new 'alice'
ralph_uno = UnoClient.new 'ralph'

bob_uno.remote_server = ENV['api_remote_server']
carol_uno.remote_server = ENV['api_remote_server']
ted_uno.remote_server = ENV['api_remote_server']
alice_uno.remote_server = ENV['api_remote_server']
ralph_uno.remote_server = ENV['api_remote_server']

bob_uno.join_game
bob_uno.join_game
bob_uno.join_game
bob_uno.join_game
bob_uno.join_game
bob_uno.join_game
sleep 1
carol_uno.join_game
sleep 1
ted_uno.join_game
sleep 1
alice_uno.join_game
sleep 1
ralph_uno.join_game
sleep 1
bob_uno.deal
sleep 1

bob_uno.get_cards
sleep 1
carol_uno.get_cards
sleep 1
ted_uno.get_cards
sleep 1
alice_uno.get_cards
