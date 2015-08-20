require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'requires a title' do
    post1 = Post.create(body: "jobs", author: "Steve")
    post2 = Post.create(title: '', body: "jobs", author: "Steve")
    post3 = Post.create!(title: 'Jobs', body: "everyday", author: "Steve")

    expect(post1).not_to be_valid
    expect(post2).not_to be_valid
    expect(post3).to be_valid
  end

  it 'requires a body' do
    post1 = Post.create(title: "finish school", author: "Steve")
    post2 = Post.create(title: 'Jobs', body: "", author: "Steve")
    post3 = Post.create!(title: 'Ballin', body: "immediately", author: "Steve")

    expect(post1).not_to be_valid
    expect(post2).not_to be_valid
    expect(post3).to be_valid
  end

  it 'requires an author' do
    post1 = Post.create(title: "finish school", body: "jobs")
    post2 = Post.create(title: 'Jobs', body: "jobs", author: "")
    post3 = Post.create!(title: 'Jobs', body: "jobs", author: "Steve")

    expect(post1).not_to be_valid
    expect(post2).not_to be_valid
    expect(post3).to be_valid
  end

  it 'is created with a status of draft' do
    post = Post.create!(title: 'Jobs', body: "everyday", author: "Steve")

    expect(post.status).to eq('draft')
  end
end
