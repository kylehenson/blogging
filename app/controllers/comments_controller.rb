class CommentsController < ApplicationController
  respond_to :json

  def create
    post = Post.find(params[:post_id])
    respond_with post.comments.create!(comment_params), location: ""

    # @comment = Comment.new(comment_params)
    # byebug
    # if @comment.save
    #   flash[:notice] = "Comment successfully created."
    # else
    #   flash[:errors] = @comment.errors.full_messages.join(', ')
    # end
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
