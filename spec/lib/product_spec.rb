require "spec_helper"
require 'json'

describe Product do
	let(:product){ Product.new('Milk') }

	it "has a title" do
		expect(product.title).to eq("Milk")
	end

	it "has a default priority" do
		expect(product.priority).to eq(10)
	end

	describe "#mark_as_bought" do
		context "not yet bought" do
			it "has not yet been bought" do
				expect(Product.new('Milk').bought?).to be false
			end
		end
		context "bought" do
			let(:product){ Product.new('Milk')}
			it "has been bought" do
				product.mark_as_bought
				expect(product.bought?).to be true
			end
		end
	end

	describe "#to_json" do
		let(:product_to_serialize){ Product.new('Cheese', 5) }

		it "serializes the product attributes in to a json object" do
			parsed_json = JSON.parse(product_to_serialize.to_json)
			expect(parsed_json) == { title: 'Cheese', priority: 5, completed: false }
		end

	end

	describe "#to_s" do

		it "Displays the product's title and priority" do
			expect(Product.new('Cheese').to_s).to eq("Cheese priority: 10")
		end

		it "indicates when the product is completed" do
			product = Product.new('Cheese')
			product.complete
			expect(product.to_s).to eq("Cheese priority: 10 --completed!")
		end

	end

end