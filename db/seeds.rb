require './config/environment.rb'
require 'faker' # not in the environment because we only need it here

10.times do

  # create Users
  user1 = User.create(name: Faker::Name.unique.name)
  user2 = User.create(name: Faker::Name.unique.name)

  # And a conversation thread
  convo = Conversation.new(name: Faker::Music::GratefulDead.song + " discussion thread")

  # Put two users into a group conversation
  UserConversation.create(user: user1, conversation: convo)
  UserConversation.create(user: user2, conversation: convo)

  # Fake up a conversation where one user is Yukihiro Matsumoto and the other is Yoda.
  250.times do
    Message.create(user: user1, conversation: convo, text: Faker::Quote.matz )
    Message.create(user: user2, conversation: convo, text: Faker::Quote.yoda )
  end
end
