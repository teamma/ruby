require 'sinatra'
require 'csv'
require 'date'

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
