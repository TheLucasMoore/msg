require './config/environment.rb'

# Create two users
u1 = User.create(name: "Lucas")
u2 = User.create(name: "Sarah")

# Create their conversation thread
convo = Conversation.new(name: "Plans Group Thread")

# Put two users into a group conversation
UserConversation.create(user: u1, conversation: convo)
UserConversation.create(user: u2, conversation: convo)

Message.create(user: u1, conversation: convo, text: "Hey!")