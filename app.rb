require 'sinatra'
require 'json'
require_relative 'server.rb'

uno = UnoServer.new

get '/api/cards' do
  return_message = {}
  return_message[:utc] = Time.now.utc.strftime("%a %b %d %H:%M:%S.%L UTC %Y")
  if params.has_key?('name')
    cards = uno.get_cards(params['name'])
    if cards.class == Array
      return_message[:status] == 'success'
      return_message[:cards] = cards
    else
      return_message[:status] = 'sorry - it appears you are not part of the game'
      return_message[:cards] = []
    end
  end
  content_type :json
  return_message.to_json
end

get '/api/hands' do
  return_message = {}
  return_message[:utc] = Time.now.utc.strftime("%a %b %d %H:%M:%S.%L UTC %Y")
  return_message[:hands] = uno.hands
  content_type :json
  return_message.to_json
end

post '/api/join' do
  return_message = {}
  return_message[:utc] = Time.now.utc.strftime("%a %b %d %H:%M:%S.%L UTC %Y")
  jdata = JSON.parse(params[:data],:symbolize_names => true)
  if jdata.has_key?(:name) && uno.join_game(jdata[:name])
    return_message[:status] = "Welcome #{ jdata[:name].capitalize }"
  else
    return_message[:status] = 'sorry - game not accepting new players'
  end
  content_type :json
  return_message.to_json
end

post '/api/deal' do
  return_message = {}
  return_message[:utc] = Time.now.utc.strftime("%a %b %d %H:%M:%S.%L UTC %Y")
  if uno.deal
    return_message[:status] = 'dealing - success'
  else
    return_message[:status] = 'dealing - fail'
  end
  content_type :json
  return_message.to_json
end

delete '/api/players' do
  uno = UnoServer.new
  return_message = {}
  return_message[:utc] = Time.now.utc.strftime("%a %b %d %H:%M:%S.%L UTC %Y")
  return_message[:hands] = uno.hands
  content_type :json
  return_message.to_json
end
