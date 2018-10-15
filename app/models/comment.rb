class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :house

  validates :content, presence: true 
end
