require 'rails_helper'

RSpec.describe 'post edit' do
  context 'with valid attributes' do
    it 'can update a post' do
      visit root_path
      click_link_or_button "Create a Post"
      fill_in "Title", with: "Jobs"
      fill_in "Body", with: "find one"
      fill_in "Author", with: "me"
      select "publish", from: "post_status"
      click_link_or_button "Submit"

      expect(current_path).to eq posts_path
      expect(page).to have_content("All Posts")
      expect(page).to have_content("Jobs")

      click_link_or_button "Edit"
      expect(page).to have_content("Edit Post:")

      fill_in "Title", with: "New Title"
      fill_in "Body", with: "New Body"
      fill_in "Author", with: "New me"
      click_link_or_button "Submit"

      expect(page).to have_content("New Title")
      expect(page).to have_content("New Body")
      expect(page).to have_content("New me")
    end

    it 'can update a posts status to draft' do
      visit root_path
      click_link_or_button "Create a Post"
      fill_in "Title", with: "Jobs"
      fill_in "Body", with: "find one"
      fill_in "Author", with: "me"
      select "publish", from: "post_status"
      click_link_or_button "Submit"

      expect(current_path).to eq posts_path
      expect(page).to have_content("All Posts")
      expect(page).to have_content("Jobs")

      click_link_or_button "Edit"
      expect(page).to have_content("Edit Post:")

      fill_in "Title", with: "New Title"
      fill_in "Body", with: "New Body"
      fill_in "Author", with: "New me"
      select "draft", from: "post_status"
      click_link_or_button "Submit"

      expect(page).to have_content("New Title")
      expect(page).to have_content("New me")
      expect(page).to have_content("draft")
      expect(page).to have_content("New Body")
    end
  end
end
