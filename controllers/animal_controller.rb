class AnimalController < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :views,  Proc.new {File.join(root, 'views')}

  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    @title = "The Zoo"
    @zoo = Animals.all
    erb :'animals/index'
  end

  get "/new" do
    @title = "New Animal"
    @zoo = Animals.new
    erb :'animals/new_animal'
  end
end
