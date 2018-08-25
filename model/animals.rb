class Animals
  attr_accessor(:id, :name, :enclosure_no, :age, :species, :class, :animal_description)
  #Method to connet apps to database
  def self.open_connection
    # connect to the post grade database and grabs all the data to the website
    connection = PG.connect(dbname: "animals")
  end

  def save
    conn = Animals.open_connection
    if(!self.id)
      sql = "INSERT INTO animals (name , enclosure_no , age , species , class , animal_description) VALUES ('#{self.name}', '#{self.enclosure_no.to_i}', '#{self.age.to_i}', '#{self.species}', '#{self.class}', '#{self.animal_description}')"
    else
      sql = "UPDATE animals SET name='#{self.name}', enclosure_no='#{self.enclosure_no.to_i}', age='#{self.age.to_i}', species='#{self.species}', class='#{self.class}', animal_description='#{self.animal_description}' WHERE id = #{self.id}"
    end
    conn.exec(sql)
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

  # find on part of the data
  def self.find(id)
    conn = self.open_connection
    sql = "SELECT * FROM animals WHERE id = #{id} LIMIT 1"
    animal_result = conn.exec(sql)
    animal = self.hydrate(animal_result[0])
  end

  def self.destroy(id)
    conn = self.open_connection
    sql = "DELETE FROM animals WHERE id = #{id}"
    conn.exec(sql)
  end

  def self.hydrate(animal_data)
    animal = Animals.new
    animal.id = animal_data['id']
    animal.name = animal_data['name']
    animal.enclosure_no = animal_data['enclosure_no'].to_i
    animal.age = animal_data['age'].to_i
    animal.species = animal_data['species']
    animal.class = animal_data['class']
    animal.animal_description = animal_data['animal_description']

    animal
  end

end
