class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validates :content, 
    presence: true,
    length: { minimum: 5, maximum: 500 }
end
