require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Ella") }
  let(:brownie) { Dessert.new('brownie', 200, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq('brownie')
    end

    it "sets a quantity" do
      expect(brownie.quantity).to eq(200)
    end

    it "starts ingredients as an empty array" do 
      expect(brownie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new('cream', 'fifty', chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
    expect(brownie.ingredients).to include('cream')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do 
      ingredients = ['sugar', 'egg', 'vanilla', 'cream']
    ingredients.each do |ingridient|
      brownie.add_ingredient(ingredient)
    end
    expect(brownie.ingridients).to eq(ingridients)
    brownie.mix!
    expect(brownie.ingredients).not_to eq (ingredients)
    expect(brownie.ingredients.sort)to eq(ingridients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do 
      brownie.eat(10)
      expect(brownie.quantity).to eq(80)
    end

    it "raises an error if the amount is greater than the quantity" do 
      expect { (brownie.eat(100)) }.to raise_error('out of brownie')
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to recieve(:titleize).and_return("Chef Ella the Great Baker")
      expect(brownie.serve).to eq("Chef Ella the Great Baker has made 80 brownies")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
      expect(chef).to recieve(:bake).with(brownie)
      brownie.make_more
    end
  end
  
end