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

  it 'requires a body' do
    post = Post.create(title: "Jobs", body: "jobs", author: "Steve")
    comment1 = Comment.create(author: "jack", post_id: "#{post.id}")
    comment2 = Comment.create(author: "jack", body: "", post_id: "#{post.id}")
    comment3 = Comment.create!(author: "jack", body: "where?", post_id: "#{post.id}")

    expect(comment1).not_to be_valid
    expect(comment2).not_to be_valid
    expect(comment3).to be_valid
  end

  it 'creates a json object with markdown when markdownify is called' do
    comment = Comment.create!(author: "jack", body: "<h2>Heading 2</h2><p><em>emphasis</em><br><strong>strong</strong></p>")

    expect(comment.markdownify(comment.body)).to eq "{\"author\":\"jack\",\"body\":\"\\u003ch2\\u003eHeading 2\\u003c/h2\\u003e\\u003cp\\u003e\\u003cem\\u003eemphasis\\u003c/em\\u003e\\u003cbr\\u003e\\u003cstrong\\u003estrong\\u003c/strong\\u003e\\u003c/p\\u003e\"}"
  end
end
