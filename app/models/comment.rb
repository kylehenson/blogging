require 'json'
class Comment < ActiveRecord::Base
  belongs_to :post

  validates :author, :body, presence: true

  def markdownify(markdown_body)
    { author: author, body: markdown_body }.to_json
  end
end
