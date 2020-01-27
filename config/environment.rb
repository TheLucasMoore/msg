# Sinatra doesn't have the asset pipeline =(
require 'sinatra'
require 'pry'
require 'active_record'
require 'require_all'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'

# This one file will load required gems
# and all other required files
require_all 'app'

# Connection to the database
db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///development')

ActiveRecord::Base.establish_connection(
 :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
 :host     => db.host,
 :username => db.user,
 :password => db.password,
 :database => 'msg_dev', # CHANGE ME
 :encoding => 'utf8'
)