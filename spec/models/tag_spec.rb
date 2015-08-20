require 'rails_helper'

RSpec.describe Tag, type: :model do
  it 'requires a name' do
    tag1 = Tag.create()
    tag2 = Tag.create(name: '')
    tag3 = Tag.create!(name: 'jobs')

    expect(tag1).not_to be_valid
    expect(tag2).not_to be_valid
    expect(tag3).to be_valid
  end

  it 'tags can be associated with a post' do
    post = Post.create(title: "Jobs", body: "jobs", author: "Steve")
    tag = Tag.create(name: 'jobs')
    tag2 = Tag.create(name: 'help')
    post.tags << tag
    post.tags << tag2

    expect(post.tags.first.name).to eq 'jobs'
    expect(post.tags.last.name).to eq 'help'
  end
end
