require 'pry'
class Owner
  # code goes here
   attr_reader :name, :species 

   @@owners = []

  def initialize(name)
    @name = name 
    @species = "human"
    @@owners << self 
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@owners 
  end

  def self.count
    self.all.count 
  end

  def self.reset_all
    self.all.clear 
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy" }
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy" }
  end

  def pets 
    self.cats.concat(self.dogs)
  end
  
  def sell_pets
     self.pets.each do |pet| 
      pet.owner = nil
      pet.mood = "nervous"
     end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end


end

# binding.pry
# 0