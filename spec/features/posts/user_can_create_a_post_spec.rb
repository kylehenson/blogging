require 'rails_helper'

RSpec.describe 'post creation' do
  it 'can create a post but should not show on the index page without changing status' do
    visit root_path
    click_link_or_button "Create a Post"
    fill_in "Title", with: "Jobs"
    fill_in "Body", with: "find one"
    fill_in "Author", with: "me"
    click_link_or_button "Submit"

    expect(current_path).to eq posts_path
    expect(page).to have_content("All Posts")
    expect(page).not_to have_content("Jobs")
  end

  it 'can create a post and should show on the index page after changing status' do
    visit root_path
    click_link_or_button "Create a Post"
    fill_in "Title", with: "Jobs"
    fill_in "Body", with: "find one"
    fill_in "Author", with: "me"
    select "publish", from: "post_status"
    click_link_or_button "Submit"

    expect(current_path).to eq posts_path
    expect(page).to have_content("All Posts")
    expect(page).to have_content("Title")
    expect(page).to have_content("Author")
    expect(page).to have_content("Jobs")
  end

  it 'cannot be created with invalid inputs' do
    visit root_path
    click_link_or_button "Create a Post"
    fill_in "Title", with: "Jobs"
    fill_in "Body", with: ""
    fill_in "Author", with: "me"
    click_link_or_button "Submit"

    expect(page).to have_content("Body can't be blank")
  end
end
