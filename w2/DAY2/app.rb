require 'sinatra'
# gem install reloader
require 'sinatra/reloader'
require 'csv'
require 'date'
# 크롤링을 위한 gem
require 'nokogiri'
require 'httparty'
require 'uri'

get '/' do
  erb :index
end

get '/welcome/:name' do
  @name = params[:name]
  @time = Time.now.to_s
  # CSV는 require 'csv'
  CSV.open('user.csv', 'a+') do |data|
    # Time.now를 쓰려면 require 'date'
    data << [@name.to_s, @time]
  end
  erb :welcome
end

get '/users' do
  @users = []
  CSV.foreach('user.csv') do |row|
    @users << row
  end
  erb :users
end

get '/lol' do
  @username = params[:username]
  url = "http://www.op.gg/summoner/userName=#{@username}"
  url = URI.encode(url) #한글 url을 인코딩한다.
  response = HTTParty.get(url) #HTTParty를 활용하여 요청보낸다.
  doc = Nokogiri::HTML(response) #Nokogiri로 검색하기 편하게 바꾼다.
  @win = doc.css("#SummonerLayoutContent > div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div.SummonerRatingMedium > div.TierRankInfo > div.TierInfo > span.WinLose > span.wins")
  @lose = doc.css("#SummonerLayoutContent > div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div.SummonerRatingMedium > div.TierRankInfo > div.TierInfo > span.WinLose > span.losses")
  erb :lol
end

get '/lolfinder' do
  erb :lolfinder
end

get '/vote' do
  erb :vote
end

get '/result' do
  @count = params[:count]
  erb :result
end
