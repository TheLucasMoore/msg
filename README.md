# Getting started

## Msg Api 3000

You can access all these endpoints in production at https://msg-api-3000.herokuapp.com/

## Local Developmenet

This application is written in Ruby and uses Sinatra and Rack. I will assume you have ruby and bundler installed.

To get this app running locally, run the following commands.

```ruby
$ git clone https://github.com/TheLucasMoore/msg.git
$ cd msg
$ bundle install
$ rake db:create
$ rake db:migrate
$ rake db:seed RACK_ENV=development
```

Then to boot the app locally, with seeded data, we'll use rack.
```ruby
$ rackup
```
If for some reason you don't have rack installed, you can run `gem install rack`.

You should then be able to hit `http://localhost:9292/` and see Brad Pitt dancing. Nice!
Note: You can replace `https://msg-api-3000.herokuapp.com/` with ``http://localhost:9292/` for all the following examples if running this locally.

# API Docs

## Users

The users controller is a RESTful way to see what seeded data we have to play around with. 

The first spot to check out is the index at `https://msg-api-3000.herokuapp.com/users`.

You should see an array of all the users.
```json
[{"id":89,"name":"Courtney Orn"},{"id":90,"name":"Mrs. Gwendolyn Torp"}]
```

To see more about a user, go to `https://msg-api-3000.herokuapp.com/users/:id` where `:id` is that user's id.
Here we can see all the conversations that this user is a part of: 

```json
{"user":{"id":90,"name":"Mrs. Gwendolyn Torp"},"conversations":[{"id":72,"name":"I Know You Rider discussion thread"}]}
```

## Messages

To send a message from one user to another, you can POST to `https://msg-api-3000.herokuapp.com/messages` with three parameters:
1. sender_id - who is sending this message
2. receipient_id - to whom it should go
3. text - the contents of the text messages

This will return the sent message. As an example:
```bash
$ curl -X POST 'https://msg-api-3000.herokuapp.com/messages/?sender_id=89&receipient_id=90&text=Hi'
{"id":16702,"user_id":89,"text":"Hi","conversation_id":72,"created_at":"2020-01-29T02:20:17.132Z"}
```
This will add a new message into two users conversations. If there isn't an existing conversation thread, it will create one.

To see all the messages a user has sent, you can use `https://msg-api-3000.herokuapp.com/users/:id/messages`

## Conversations

A conversation is where messages live. A conversation has many users, but for the sake of this app we'll have the two required users.

To see all the back-and-forth messages in a conversation, check out the data at `https://msg-api-3000.herokuapp.com/conversations/:convo_id'.
This endpoint also has parameters to limit by number of messages and by timeframe.

## Limit to number of messages
To limit to the last hundred messages use `https://msg-api-3000.herokuapp.com/conversations/72?number_messages=100`

```json
[
  {"id":16700,"user_id":89,"text":"Actually, I didn't make the claim that Ruby follows the principle of least surprise. Someone felt the design of Ruby follows that philosophy, so they started saying that. I didn't bring that up, actually.","conversation_id":72,"created_at":"2020-01-29T02:08:25.854Z"},
  {"id":16701,"user_id":90,"text":"Ready are you? What know you of ready? For eight hundred years have I trained Jedi. My own counsel will I keep on who is to be trained. ","conversation_id":72,"created_at":"2020-01-29T02:08:25.858Z"},
  {"id":16702,"user_id":89,"text":"Hi","conversation_id":72,"created_at":"2020-01-29T02:20:17.132Z"},
  {"id":16703,"user_id":89,"text":"Hi","conversation_id":72,"created_at":"2020-01-29T02:20:50.838Z"}
  ... and on and on
]
```
## Limit by time
To limit to messages within a certain timeframe use `https://msg-api-3000.herokuapp.com/conversations/72?days_ago=30`

# Testing

To run the test suite, use this command:
```
$ bundle exec rspec --format documentation
```

# Trade Offs and Considerations

My first consideration here is scaling. When building a messaging API that can send a message between two users, I did not want to 
simple hard-code a `sender_id` and `recipient_id` into the Message model.

What if we want to add group messaging soon? So I have the `Conversation` model with many users,
which allows the ability to add many users into a group thread if we want to eventually.

This app is built with Sinatra because I thought Rails would be a bit heavy-handed. This sticks to models and controllers. Plus, getting out of my confort zone is fun!
This decision also meant I spent some time on configuration of things that "just work" in Rails, like the database connection and test setup.

To be honest, testing is not complete. I showed how a Controller and Model test are structured and I decided to stop with those.

Model validations are also not super verbose at the moment, since I'm relying on seeded data to play around with this project.

## Bibliography

* Many sources are sprinkled around in code comments here and there, but these are good resource I found in building this.
* Followed the [setup docs](http://sinatrarb.com/intro.html)
* Setting up [rspec](http://shiroyasha.io/sinatra-app-with-rspec.html)
* Configuring Rack and setting up [multiple controllers](https://learn.co/lessons/sinatra-multiple-controllers)
* Deploying [Rack apps to Heroku](https://devcenter.heroku.com/articles/rack)
* Running [Rake commands on Heroku](https://devcenter.heroku.com/articles/rake)

