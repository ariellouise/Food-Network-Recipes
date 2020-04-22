
#the recipes being shown as a recipe - level 2 and child file

class Recipe
  @@all = []
  @@type = "recipe"

  attr_accessor :name, :url, :ingredients, :instructions

  def initialize(name, url)
    @name = name
    @url = url
    @ingredients = []
    @instructions = []
    self.class.all << self
  end
  
  def self.all
    @@all
  end 
  
  def self.get_recipe(list)
    self.scrape_all_recipes(list)
    puts "Here are all of the recipes available to you:"
    recipe_index = Menu.display(self.type, recipes)
  end
    
  def self.scrape_all_recipes(list)
   doc = Nokogiri::HTML(open(list.url))
   posts = deoc.css(div.tve_post")
   
   posts.each do |post|
    name = (").text
    url = post.css("a").attr("href").value
    recipe = self.new(name, url)
   end
  end
  
  def print
   self.get_complete_recipe
   puts "\n(self.name)"
   puts "\nIngredients:"
   self.ingredients.each do |ingredient|
     puts clean_ingredient(ingredient)
   end
   puts "\nInstructions:"
   self.instructions.each_with_index do |instruction, index|
     puts "#{index + 1}. #{instruction}"
   end 
  end
  
  def get_complete_recipe
    doc = Nokogiri::HTML(open(self.url))
    ingredients_data = doc.css()
    ingredients_data.each do |ingredient|
      amount = ingredient.css()
      unit = ingredient.css()
      name = ingredient.css()
      end
      self.ingredients.push("#{amount} #{unit} #{name}")
    end
    
    instructions_data = doc.css()
    instructions_data.each do |instructions|
      self.instructions.push(instruction.text)
    end
    