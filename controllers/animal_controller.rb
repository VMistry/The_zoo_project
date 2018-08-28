class AnimalController < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :views,  Proc.new {File.join(root, 'views')}
  set :public_folder, Proc.new { File.join(root, 'public') }

  configure :development do
    register Sinatra::Reloader
  end
  # Main page
  get "/" do
    @title = "The Zoo"
    @zoo = Animals.all
    erb :'animals/index'
  end
  # To insert a new animal
  get "/new" do
    @title = "New Animal"
    @zoo = Animals.new
    erb :'animals/new_animal'
  end
  # To open a page for an animal the user would like to see.
  get "/:id" do
    id = params[:id].to_i
    @zoo = Animals.find(id)
    erb :'animals/show'
  end
  # To edit an existing animal
  get "/:id/edit" do
    @title = "Edit"
    #Gets the id on the selected page
    id = params[:id].to_i
    # Storing the object with that id in to @posts variable
    @zoo = Animals.find(id)
    erb :'animals/edit'
  end
  # Save changes to the database
  post "/" do
    animals = Animals.new
    animals.name = params[:name]
    animals.enclosure_no = params[:enclosure_no]
    animals.age = params[:age]
    animals.species = params[:species]
    animals.class = params[:class]
    animals.animal_description = params[:animal_description]
    animals.save
    redirect "/"
  end
  # Used to udpate an existing animal
  put "/:id" do
    id = params[:id].to_i
    animal = Animals.find(id)
    animal.name = params[:name]
    animal.enclosure_no = params[:enclosure_no]
    animal.age = params[:age]
    animal.species = params[:species]
    animal.class = params[:class]
    animal.animal_description = params[:animal_description]
    animal.save
    redirect "/"
  end
  # To delete an existing animal.
  delete "/:id" do
    id = params[:id].to_i
    Animals.destroy(id)
    redirect '/'
  end

end
