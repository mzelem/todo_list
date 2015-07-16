require "spec_helper"

describe Task do
	let(:task){ Task.new('Pay bills') }

	it "has a title" do
		expect(task.title).to eq("Pay bills")
	end

	it "has a default priority" do
		expect(task.priority).to eq(10)
	end

	describe "#complete?" do
		context "uncompleted" do
			it "is not complete" do
				expect(Task.new('Pay bills').complete?).to be false
			end
		end
		context "completed" do
			let(:task){ Task.new('Pay bills')}
			it "is complete" do
				task.complete
				expect(task.complete?).to be true
			end
		end
	end

end
