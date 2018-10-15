require 'rails_helper'

RSpec.describe Comment, type: :model do

  let (:user) { create(:user) }
  let (:house) { create(:house) }

  it 'is valid with valid attributes' do
    @comment = Comment.new
    @comment.user = user
    @comment.house = house
    @comment.content = "user's comment"
    expect(@comment).to be_valid
  end

  it 'is not valid without a house' do
    @comment2 = Comment.new
    @comment2.user = user
    @comment2.house = house
    @comment2.content = ""
    expect(@comment2).not_to be_valid
  end

  it 'is not valid without a user' do
    @comment3 = Comment.new
    @comment3.house = house
    @comment3.user = nil
    @comment3.content = "content"
    expect(@comment3).not_to be_valid
  end

  it 'is not valid without content' do
    @comment4 = Comment.new
    @comment4.user = user
    @comment4.house = house
    @comment4.content = nil
    expect(@comment4).not_to be_valid    
  end

end
