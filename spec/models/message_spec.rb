require 'spec_helper'

RSpec.describe Message do

  it 'adds created_at time stamp if does not exist' do
    msg = Message.create
    expect(msg.created_at).to be
  end

  it 'adds created_at time stamp if does not exist' do
    frozen_time = 4.days.ago
    msg = Message.create(created_at: frozen_time)
    expect(msg.created_at).to eq frozen_time
  end
end