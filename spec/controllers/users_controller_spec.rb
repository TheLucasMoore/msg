require 'spec_helper'

RSpec.describe MessagesController do  
  let!(:user1) { User.find_or_create_by(name: "Lucas") }

  it 'shows all messages for a user' do
    get "/users/#{user1.id}/messages"
    expect(last_response).to be_ok
  end
end