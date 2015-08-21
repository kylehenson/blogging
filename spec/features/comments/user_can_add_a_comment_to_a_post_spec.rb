require 'rails_helper'

RSpec.describe 'comment creation' do
  xit 'can create a comment associated with a post' do
    post = Post.create(title: "Jobs", body: "find one", author: "me", status: "publish")

    visit post_path(post.id)
    expect(page).to have_content("<< Back to all Posts")
    expect(page).to have_content("Jobs")

    fill_in "comment-author", with: "Jess"
    fill_in "comment-body", with: "I have one"
    click_link_or_button "Add Comment"
    save_and_open_page

    visit post_path(post.id)
    expect(page).to have_content("Jobs")
    expect(page).to have_content("Comments:")
    expect(page).to have_content("Jess")
    expect(page).to have_content("I have one")
  end
end
