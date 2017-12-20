class PostController < ApplicationController
  def index
    @posts = Post.all.reverse
  end

  def new
    # form에서 쓰는 창이니까 아무것도 없다!
  end

  def create

    Post.create(
      username: params[:username],
      title: params[:title],
      content: params[:content]
    )

    redirect_to '/'
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.all
  end


  def destroy
    Post.find(params[:id]).destroy
    redirect_to '/'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(
      username: params[:username],
      title: params[:title],
      content: params[:content]
    )

    redirect_to "/post/show/#{params[:id]}"
  end

  def add_comment
    Comment.create(
      content: params[:content],
      post_id: params[:id]
    )
    redirect_to :back
  end

end
