class CommentsController < ApplicationController
  respond_to :json

  def create
    comment = Post.find(params[:post_id]).comments.create!(comment_params)
    respond_with comment.markdownify(markdown(comment.body)), location: ""
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
