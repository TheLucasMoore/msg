require 'spec_helper'

RSpec.describe ConversationsController do

  it 'shows conversations' do
    get 'conversations/1'
    expect(last_response).to be_ok
  end
end