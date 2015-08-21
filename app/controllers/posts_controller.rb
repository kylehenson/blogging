class PostsController < ApplicationController

  def index
    @posts = Post.all
    @tags = Tag.all
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
    params["post"]["tag_ids"].reject!(&:blank?)
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
    params["post"]["tag_ids"].reject!(&:blank?)
    @tags = Tag.all
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "successfully updated post."
      redirect_to post_path(@post)
    else
      flash[:errors] = @post.errors.full_messages.join(', ')
      render :edit
    end
  end

  def remove_image
    post = Post.find(params[:post_id])
    post.image = nil
    post.save
    redirect_to post_path(post)
  end

  private

  def post_params
    params.require(:post).permit(:title,
                                 :body,
                                 :author,
                                 :status,
                                 :image,
                                 :tag_ids => [])
  end
end
