class PostController < ApplicationController

  def index
    @posts = Post.all.reverse
  end

# Create

  def new
  end

  def create
    Post.create(
      username: params[:username],
      title: params[:title],
      content: params[:content]
    )
    redirect_to '/'
  end

# Read

  def show
    @post = Post.find(params[:id])
    @comment = Comment.all
  end

# Update

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

# Delete

  def destroy
    Post.find(params[:id]).destroy
    redirect_to '/'
  end

# Add comment

  def add_comment
    Comment.create(
      content: params[:content],
      post_id: params[:id]
    )
    redirect_to :back
  end

  def register

  end

  def memberlist

  end
end
