require 'sinatra'
require 'sinatra/reloader'
require 'nokogiri'
require 'httparty'
require 'rest-client'
require 'uri'


get '/' do
  erb :index
end

get '/btg' do
  @username = params[:username]
  url = "https://dak.gg/profile/#{@username}"
  url = URI.encode(url)
  response = RestClient.get(url)
  doc = Nokogiri::HTML(response)
  @rating = doc.css("#profile > div.profileContent > div.modeSummary > section.solo.modeItem > div.mode-section.tpp > div.overview > div.rating > span.value")
  @chicken = doc.css("#profile > div.profileContent > div.modeSummary > section.solo.modeItem > div.mode-section.tpp > h1 > em").text.split[0].delete("W")
  erb :btg
end

get '/btgfinder' do
  erb :btgfinder
end
