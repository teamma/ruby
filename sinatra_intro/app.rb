require 'sinatra'
require 'sinatra/reloader'
require 'csv'
require 'date'

before do
  p '*************************************'
  p params
  p '*************************************'
end

get '/' do
  send_file 'index.html'
end

# form 에서 글 쓰는 곳
get '/post' do
  erb :post
end

get '/complete' do
  @title = params[:title]
  @content = params[:content]
  CSV.open('post.csv', 'a+:utf-8') do |csv|
    csv << [@title, @content]
  end
  erb :complete
end

get '/posts' do
  @posts = []
  CSV.foreach('post.csv',encoding: 'utf-8') do |row|
    @posts << row
  end
  erb :posts
end

get '/signup' do
  erb :signup
end

get '/usercomplete' do
  @email = params[:email]
  @pwd = params[:pwd]
  @pwd2 = params[:pwd2]
  @time = Time.now.to_s
  #비밀번호 두개가 같으면 완료
  if @pwd == @pwd2
    CSV.open('user.csv', 'a+:utf-8') do |csv|
      csv << [@email, @pwd, @time]
    end
    erb :usercomplete
  # 아니면, 다시 회원가입 페이지(/signup)로
  else
    redirect '/signup'
  end
end

get '/users' do
  @users = []
  CSV.foreach('user.csv',encoding: 'utf-8') do |row|
    @users << row
  end
  erb :users
end
