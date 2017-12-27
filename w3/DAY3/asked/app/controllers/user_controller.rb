class UserController < ApplicationController
  def index
    @users = User.all
  end

  def new
    # 사용자에게 form 창을 보여주는 곳
  end

  def create
    # 정보를 받아서 데이터베이스에서 만드는 (C)
    @user = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
  end

  def login
    # 로그인을 위한 form
  end

  def login_process
    # 0. params[:email], params[:password], params[:name]
    @user = User.find_by(email: params[:email])
    # 1. mail주소가 우리 db에 없으면,(가입한 적이 없으면)
    if @user.nil?
      # 1-1.없는 아이디 -> 회원가입
      flash[:alert] = "등록되지 않은 회원입니다. 등록해주세요."
      redirect_to '/user/new'
    # 1-2. mail주소가 db에 있으면, 비밀번호를 확인
    else
      # 2-1. 맞으면, 로그인
      if @user.password == params[:password]
        session[:user_id] = @user.id
        flash[:notice] = "#{@user.name}님 로그인에 성공하였습니다!"
        redirect_to '/'
        # 2-2.틀리면, 비밀번호가 틀렸습니다.
      else
        flash[:alert] = "비밀번호가 틀렸습니다."
        redirect_to :back
      end
    end
  end

  def logout
    session.clear
    flash[:exit] = "로그아웃에 성공하였습니다!"
    redirect_to '/'
  end
end
