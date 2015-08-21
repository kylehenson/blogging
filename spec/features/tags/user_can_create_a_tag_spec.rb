require 'rails_helper'

RSpec.describe 'tag creation' do
  it 'can create a tag' do
    visit root_path
    click_link_or_button "View Tags"
    expect(current_path).to eq tags_path

    click_link_or_button "Create a Tag"
    fill_in "Name", with: "Tech"
    click_link_or_button "Submit"

    expect(current_path).to eq tags_path
    expect(page).to have_content("All Tags")
    expect(page).to have_content("Tech")
  end
end
