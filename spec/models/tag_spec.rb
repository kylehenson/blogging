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
end
