# require 'httparty'
require 'rest-client'
require 'uri'
require 'nokogiri'
require 'json'
require 'httparty'

url = "https://api.telegram.org/bot"
token = "501251476:AAHbFdi2JfIFTV-puh6yzKaKrwY_fxF5yQk"
get_id_url = url+token+"/getupdates"
response = RestClient.get(get_id_url)
# puts response.body
hash = JSON.parse(response)
chat_id = hash["result"][0]["message"]["from"]["id"]
# puts chat_id
#####################################################################################
url_kospi = "http://finance.naver.com/sise/"
response_kospi = HTTParty.get(url_kospi)
doc = Nokogiri::HTML(response_kospi)
kospi = doc.css("#KOSPI_now")
# puts ram.text
#####################################################################################
# msg = "^__^"
msg_url = "#{url}#{token}/sendMessage?chat_id=#{chat_id}&text=현재 코스피지수: #{kospi.text}"
puts msg_url
RestClient.get(URI.encode(msg_url))
