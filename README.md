#### 처음에 github에 올릴 때
1. 해당 폴더에서 git을 사용하겠다. (로컬저장소)
  `git init`
2. 해당 폴더 내에 있는 모든 파일들의 변경 사항을 기록하겠다.
  `git add .`
3. 지금까지의 변경 사항들을 저장(commit)하겠다.
  `git commit -m "내가 원하는 말"`
4. 내가 사용할 원격 저장소를 추가한다.
  `git remote add origin "https://github.com/teamma/ruby.git"`
5. 파일들을 원격 저장소에 보겠다.
  `git push origin master`

#### 파일을 수정한 후에 올릴 때
1. 해당 폴더 내에 있는 모든 파일들의 변경 사항을 기록하겠다.
  `git add .`
2. 지금까지의 변경 사항들을 저장(commit)하겠다.
  `git commit -m "내가 원하는 말"`
3. 파일들을 원격 저장소에 보겠다.
  `git push origin master`

---

### 네이버 주식 정보 크롤링

- 실습코드

  ```ruby
  # gem을 사용하기 위해 불러온다.
  # 요청을 보내기 위한 httparty

  require 'httparty'
  # 원하는 정보를 가져오기 위한 nokogiri
  require 'nokogiri'

  # 1. 네이버 국내증시 주소를 url에 저장한다.
  url = "http://finance.naver.com/sise/"
  # 2. url을 통해서 요청한다,
  response = HTTParty.get(url)
  # 3. 가져온 문서를 nokogiri 형식으로 저장한다. for 컴퓨터
  doc = Nokogiri::HTML(response)
  # 4. 문서에서 css 중 ID가 KOSPI_now 인것을 kospi라는 변수에 저장
  # css를 가져오기 위해서 크롬에서 copy selector
  kospi = doc.css("#KOSPI_now")
  # 5. kospi에 저장된 것 중에서 태그 안에 있는 텍스트를 출력한다.
  puts kospi.text
  ```

- 사용한 gem들

  [nokogiri](https://github.com/sparklemotion/nokogiri)

  ​
