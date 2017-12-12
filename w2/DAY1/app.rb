# http://localhost:4567/
require 'sinatra'
# http://localhost:4567
get '/' do
  send_file 'index.html'
end
# http://localhost:4567/welcome
get '/welcome' do
  erb   :welcome
end
# url에 :name을 쓰면 params[:name]으로 받을 수 있다.
# 예시) /welcome/taki  params[:name] == "taki"
get '/welcome/:name' do
  # @name이라고 하면, erb에서 불러 올 수 있다.
  @name = params[:name]
  erb :welcome
end
# http://localhost:4567/6
get '/squre/:num' do
  # erb는 views 폴더에서 가져온다.
  @num = params[:num]
  erb :hello
end
get '/lotto' do
  @lotto = (1..45).to_a.sample(6)
  erb :lotto
end
get '/google' do
  erb :google
end
get '/search' do
  @q = params[:q]
  @name = params[:name]
  erb :search
end
get '/lunch' do
  @lunch = ["멀캠20층","순남시래기","명동칼국수"].sample
  @img_url = {
    "멀캠20층" =>"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUMaSdCnCSXbsf0bA2wVL_DQwlH7Fnk5WX7UjtMrMGJShg0RgJNw",
    "순남시래기" => "http://cfile2.uf.tistory.com/image/2245084D55A66F720BCABC",
    "명동칼국수" => "http://cfile21.uf.tistory.com/image/2427F53C52FFA6CC37703E"
  }
  erb :lunch
end
