require 'spec_helper'

describe Candidate do

  it { should have_many(:notes).dependent(:destroy) }

  describe ".available_states" do
    it "returns the available states" do
      Candidate.available_states.should == ['pending', 'hired', 'rejected']
    end
  end

  describe "#name" do
    context "with first and last name" do
      subject { Candidate.new(first_name: 'John', last_name: 'Doe').name }
      it "returns the full name" do
        subject.should == "John Doe"
      end
    end

    context "with first name only"
    context "with last name only"
  end
end
