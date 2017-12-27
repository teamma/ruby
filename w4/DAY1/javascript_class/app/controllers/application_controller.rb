class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :user_signed_in?
  def current_user
    # 현재 로그인한 유저의 정보(객체)를 리턴
    if !session[:user_id].nil?
      @current_user = User.find(session[:user_id])
    end
    @current_user
  end

  def user_signed_in?
    # 메소드 명이 ?로 끝날 경우 리턴 값이 boolean 타입
    # 로그인 한 경우 true, 아닐 경우 false
    !session[:user_id].nil?
  end

  def authenticate_user!
    # !(bang) 주의해야할 메소드입니다.
    # 로그인하지 않은 경우에 로그인 페이지로 이동시킴
    if session[:user_id].nil?
      redirect_to '/signin', notice: "로그인해주세요."
    end
  end
end
