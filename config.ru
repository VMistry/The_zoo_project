# Grabs and uses the sinatra file
require 'sinatra'
# Makes the installation quicker
require 'sinatra/contrib'
# This will make changes to browser anything done in development if it is being developed.
require 'sinatra/reloader' if development?
require 'pry'
# Link to the model folder, post file.
require_relative "./model/animals.rb"
# Link to the controllers folder, post_controller file.
require_relative './controllers/animal_controller.rb'
require 'pg'
use Rack::Reloader
use Rack::MethodOverride
run AnimalController
