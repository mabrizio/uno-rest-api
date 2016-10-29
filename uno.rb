#!/usr/bin/env ruby

require 'json'
require 'rest-client'

class UnoClient
  attr_reader :name
  attr_accessor :api_url

  def initialize name
    @name = name
    @api_url = api_url
  end

  def join_game
    puts RestClient.post "#{ @api_url }/join", :data => {name: @name}.to_json, :accept => :json
  end

  def get_cards
    puts RestClient.get "#{ @api_url }/cards", {:params => {:name => @name}}
  end

  def get_hands
    puts RestClient.get "#{ @api_url }/hands"
  end

  def status
    puts RestClient.get "#{ @api_url }/cards", {:params => {:name => @name}}
  end

  def deal
    puts RestClient.post "#{ @api_url }/deal", :data =>{}.to_json, :accept => :json
  end

  def delete_players
    puts RestClient.delete "#{ @api_url }/players"
  end

end



command = ARGV[0]
param = ARGV[1]

uno = UnoClient.new param
uno.api_url = ENV['api_url']

uno.join_game if command == 'join'
uno.deal if command == 'deal'
uno.get_hands if command == 'hands'
uno.get_cards if command == 'cards'
uno.delete_players if command == 'clear'
