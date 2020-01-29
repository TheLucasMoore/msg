require 'spec_helper'

RSpec.describe User do

  it 'makes a user' do
    user = User.create(name: "Lucas")
    expect(user.name).to eq "Lucas"
  end

  it 'requires a unique name of user' do
    user1 = User.create(name: "Lucas")
    user2 = User.new(name: "Lucas")
    expect(user2.valid?).to eq false
  end
end