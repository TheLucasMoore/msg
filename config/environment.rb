# Sinatra doesn't have the asset pipeline =(
require 'sinatra'
require "sinatra/reloader" if development?
require 'json'
require 'rake'
require 'pry'
require 'active_record'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require 'require_all'

# sets every controller to default as json
set :json_encoder, :to_json

ENV['RACK_ENV'] ||= 'development'
# This one file will load required gems
# and all other required files
require_all 'app'

# Connection to the database based on rake env, which lines up with database.yml
db = URI.parse(ENV['DATABASE_URL'] || "postgres:///msg_#{ENV['RACK_ENV']}")

# https://apidock.com/rails/ActiveRecord/Base/establish_connection/class
ActiveRecord::Base.establish_connection(
 :adapter  => 'postgresql',
 :host     => db.host,
 :username => db.user,
 :password => db.password,
 :database => db.path.remove('/'),
 :encoding => 'utf8'
)