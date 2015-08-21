require 'rails_helper'

RSpec.describe 'add tags to post' do
  xit 'can attach tags to a post' do
    post = Post.create(title: "Jobs", body: "find one", author: "me", status: "publish")
    visit post_path(post.id)
    expect(page).to have_content("<< Back to all Posts")
    expect(page).to have_content("Jobs")
    expect(page).to have_content("Tags:")

    expect(page).not_to have_content("econ")
    select "econ", from: "post_tags"
    click_link_or_button "Add Tag"

    expect(page).to have_content("econ")
  end
end
