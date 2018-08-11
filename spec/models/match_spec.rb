require 'rails_helper'

RSpec.describe Match, :type => :model do
	subject { described_class.new(category: "Anything", position: "Anything", field: "Anything", start_time: "21:00",
																date: DateTime.now, num_of_player: 4 ) }

  it "is valid with valid attributes" do
  	expect(subject).to be_valid
  end

  it "is not valid without a category" do
  	subject.category = nil
		expect(subject).to_not be_valid
  end

  it "is not valid without a position" do
  	subject.position = nil
  	expect(subject).to_not be_valid
  end

  it "is not valid without a field" do
		subject.field = nil
  	expect(subject).to_not be_valid
  end

  it "is not valid without a start_time" do 
  	subject.start_time = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a date" do
  	subject.date = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a num_of_player" do
  	subject.num_of_player = nil
    expect(subject).to_not be_valid
	end

	describe "Associations" do
	  it "has one student" do
	    assc = described_class.reflect_on_association(:student)
	    expect(assc.macro).to eq :has_one
	  end

	  it "has one admin" do
	    assc = described_class.reflect_on_association(:admin)
	    expect(assc.macro).to eq :has_one
	  end
	end
end
