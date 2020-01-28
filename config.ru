require 'sinatra'

require_relative 'app/controllers/base_controller'
require_relative 'app/controllers/users_controller'
require_relative 'app/controllers/messages_controller'
require_relative 'app/controllers/conversations_controller'

use UsersController
use MessagesController
use ConversationsController
run BaseController