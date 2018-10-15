require 'rails_helper'

RSpec.describe User do
  let(:user) { create(:user) }

  it 'is valid' do
    expect(user).to be_valid
  end

  context 'email' do 
    it 'is not valid without' do
      user.email = ''
      expect(user).not_to be_valid
    end
  end
end
