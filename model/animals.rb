class Animals
  attr_accessor(:id, :name, :enclosure_no, :age, :species, :class, :animal_description)
  #Method to connet apps to database
  def self.open_connection
    # connect to the post grade database and grabs all the data to the website
    connection = PG.connect(dbname: "animals")
  end

  def self.all
    # Create an open_connection
    conn = self.open_connection
    # Select all the data within each row of the table
    sql = "SELECT id, name, enclosure_no, age, species, class, animal_description FROM animals ORDER BY id"
    results = conn.exec(sql)
    # Store all the data within an array called animals
    animals = results.map do |result|
      self.hydrate(result)
    end

    animals
  end

  def self.hydrate(post_data)
    animal = Animals.new
    animal.id = post_data['id']
    animal.name = post_data['name']
    animal.enclosure_no = post_data['enclosure_no']
    animal.age = post_data['age']
    animal.species = post_data['species']
    animal.class = post_data['class']
    animal.animal_description = post_data['animal_description']

    animal
  end

end
