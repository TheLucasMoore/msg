require 'sinatra'

require_relative 'app/controllers/base_controller'
require_relative 'app/controllers/users_controller'
require_relative 'app/controllers/messages_controller'

use UsersController
use MessagesController
run BaseController