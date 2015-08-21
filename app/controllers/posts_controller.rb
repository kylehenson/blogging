class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @tags = Tag.all
  end

  def new
    @post = Post.new
    @tags = Tag.all
  end

  def create
    @tags = Tag.all
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post successfully created."
      redirect_to posts_path
    else
      flash[:errors] = @post.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @tags = Tag.all
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "successfully updated post."
      redirect_to post_path(@post)
    else
      flash[:errors] = @post.errors.full_messages.join(', ')
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title,
                                 :body,
                                 :author,
                                 :status,
                                 :tag_ids)
  end
end
