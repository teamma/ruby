# gem을 사용하기 위해 불러온다.
# 요청을 보내기 위한 httparty

require 'httparty'
# 원하는 정보를 가져오기 위한 nokogiri
require 'nokogiri'
require 'rest-client'

# 1. 네이버 국내증시 주소를 url에 저장한다.
url = "http://prod.danawa.com/info/?pcode=4343051&keyword=ddr4%208g%20pc4-19200&cate=112752"

# 2. url을 통해서 요청한다,
# response = HTTParty.get(url)
response = RestClient.get(url)
# 3. 가져온 문서를 nokogiri 형식으로 저장한다. for 컴퓨터
doc = Nokogiri::HTML(response)
# 4. 문서에서 css 중 ID가 KOSPI_now 인것을 kospi라는 변수에 저장
# css를 가져오기 위해서 크롬에서 copy selector
kospi = doc.css("#top_PN139_93060")
# 5. kospi에 저장된 것 중에서 태그 안에 있는 텍스트를 출력한다.
# puts doc
puts kospi.text
