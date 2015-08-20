require 'rails_helper'

RSpec.describe 'post edit' do
  context 'with valid attributes' do
    it 'can update a post' do
      visit root_path
      click_link_or_button "Create a Post"
      fill_in "Title", with: "Jobs"
      fill_in "Body", with: "find one"
      fill_in "Author", with: "me"
      click_link_or_button "Submit"

      expect(current_path).to eq posts_path
      expect(page).to have_content("All Posts")
      expect(page).not_to have_content("Jobs")

      click_link_or_button "Edit"

      fill_in "Title", with: "New Title"
      fill_in "Body", with: "New Body"
      fill_in "Author", with: "New me"
      click_link_or_button "Submit"
    end
  end
end
