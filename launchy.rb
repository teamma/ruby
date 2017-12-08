# 브라우저 오픈과 관련된 gem 을 불러온다.
require 'launchy'

# 검색어 배열을 만든다.
idol = ['likelion','multicampus']

# 검색 url을 저장한다.
url = 'https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query='

# 반복한다.
idol.each do |name|
  Launchy.open(url+name)
end
