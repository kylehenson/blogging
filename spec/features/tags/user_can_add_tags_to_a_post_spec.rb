require 'rails_helper'

RSpec.describe 'add tags to post' do
  it 'can attach tags to a post' do
    Post.create(title: "Jobs", body: "find one", author: "me", status: "publish")
    Tag.create(name: "econ")
    Tag.create(name: "awesome")

    visit posts_path
    expect(page).to have_content("All Posts")
    expect(page).to have_content("Jobs")
    click_link_or_button "Edit"

    select "econ", from: "post_tag_ids"
    select "awesome", from: "post_tag_ids"
    click_link_or_button "Submit"
    expect(page).to have_content("Tags:")
    expect(page).to have_content("econ")
    expect(page).to have_content("awesome")
  end
end
