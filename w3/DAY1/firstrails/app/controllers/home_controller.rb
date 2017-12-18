class HomeController < ApplicationController
  # 컨트롤러는 액션의 모음이다.
  # 모델과 뷰 사이의 중간관리자이다.
  # action
  # app/views/컨트롤러이름/액션이름.html.erb
  # app/views/home/index.html.erb
  def index
  end
  # action
  # app/views/home/lotto.html.erb
  def lotto
    @lotto = (1..45).to_a.sample(6).sort
  end

  def welcome
    @name = params[:name]
  end

  def square
    @num = params[:num]
  end

  def lunch
    @lunch = ["멀캠20층","순남시래기","명동칼국수"].sample
    @img_url = {
      "멀캠20층" =>"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUMaSdCnCSXbsf0bA2wVL_DQwlH7Fnk5WX7UjtMrMGJShg0RgJNw",
      "순남시래기" => "http://cfile2.uf.tistory.com/image/2245084D55A66F720BCABC",
      "명동칼국수" => "http://cfile21.uf.tistory.com/image/2427F53C52FFA6CC37703E"
    }
  end

  def google

  end

  def naver
  end

  def vote
  end

  def result
    @vote = params[:vote]
  end

  def btg
    @username = params[:username]
    url = "https://dak.gg/profile/#{@username}"
    url = URI.encode(url)
    response = RestClient.get(url)
    doc = Nokogiri::HTML(response)
    @rating = doc.css("#profile > div.profileContent > div.modeSummary > section.solo.modeItem > div.mode-section.tpp > div.overview > div.rating > span.value").text
    @chicken = doc.css("#profile > div.profileContent > div.modeSummary > section.solo.modeItem > div.mode-section.tpp > h1 > em").text.split[0].delete("W")
  end

  def randomgame
  #   @username = params[:username]
  #   doc.css("#body > div:nth-child(2) > ng-include:nth-child(2) > div.content.intro.ng-scope > div.intro-main.ng-scope > div > div.ng-scope > div:nth-child(2) > div.ng-scope > div > div > input")
  end

  def random_complete
    @username = params[:username]
    @var1 = ["행복", "사랑", "열정"].sample
    @var2 = ["바보","멍청이", "천재"].sample
  end
  def btgfinder

  end

end
