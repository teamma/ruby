require 'sinatra'
 require 'sinatra/reloader'
 require 'data_mapper'
+require './model.rb'
 # 가상환경에서 localhost 사용하기 위한 설정
 set :bind, '0.0.0.0'

 before do
   p params
 end

-# DataMapper를 사용하는데, db 파일을 현재 경로에 blog.db라고 저장하겠다.
-DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/blog.db")
-# Post라는 클래스를 만들고, db(table)을 만든다.
-# 머리에 엑셀을 띄어놓으세요..!
-class Post
-  include DataMapper::Resource
-  # (자동)id는 고유한 값이고, 저장할 수록 1부터 하나씩 증가한다.
-  property :id, Serial
-  # title은 String 타입이다. 길이는 50
-  property :title, String
-  # content는 Text 타입이다. String보다 많이 긴 문자열
-  property :content, Text
-  # (자동)날짜시간을 저장한다.
-  property :created_at, DateTime
-end
-
-# model(데이터베이스) 설정이 끝났다!
-DataMapper.finalize
-
-# 설정이 끝났으니까, table을 만들어줘! (엑셀 테이블이 뿅!)
-Post.auto_upgrade!
-
 # 게시글을 다 보여주는 곳
 get '/' do
   @posts = Post.all
@@ -84,7 +63,8 @@ class Post
 # 2. 실제로 db에 저장
 get '/update/:id' do
   post = Post.get(params[:id])
-  post.update(:title => params[:title],
+  post.update(:title =>
+    params[:title],
   :content => params[:content])
   redirect '/'
 end
