require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe 'instance methods' do
    it '#all_ingredients' do
      chef = Chef.create(name: 'Taylor Phillips')
      dish = Dish.create(name: 'Steak', description: 'Very good', chef_id: chef.id) 
      ingredient1 = Ingredient.create(name: 'Filet', calories: 950)
      ingredient2 = Ingredient.create(name: 'Butter', calories: 400)
      ingredient3 = Ingredient.create(name: 'Thyme', calories: 15)

      DishIngredient.create(dish_id: dish.id, ingredient_id: ingredient1.id)
      DishIngredient.create(dish_id: dish.id, ingredient_id: ingredient2.id)
      DishIngredient.create(dish_id: dish.id, ingredient_id: ingredient3.id)

      expect(chef.all_ingredients).to eq([ingredient1, ingredient2, ingredient3])
    end
  end
end
