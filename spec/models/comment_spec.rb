require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'requires an author' do
    post = Post.create(title: "Jobs", body: "jobs", author: "Steve")
    comment1 = Comment.create(body: "where?", post_id: "#{post.id}")
    comment2 = Comment.create(author: '', body: "where?", post_id: "#{post.id}")
    comment3 = Comment.create!(author: "jack", body: "where?", post_id: "#{post.id}")

    expect(comment1).not_to be_valid
    expect(comment2).not_to be_valid
    expect(comment3).to be_valid
  end

end
