require 'spec_helper'

describe Candidate do
  it { should have_many(:notes) }

  describe "#last_first" do
    let(:candidate) { Fabricate(:candidate, first_name: "John", last_name: "Doe") }
    subject { candidate.last_first }
    it "is the candidates full name" do
      subject.should == "Doe, John"
    end
  end

  describe ".search" do
    let!(:candidate_john) { Fabricate(:candidate, first_name: "John", last_name: "Doe") }
    let!(:candidate_dave) { Fabricate(:candidate, first_name: "Dave", last_name: "Happy") }
    let!(:candidate_joe) { Fabricate(:candidate, first_name: "Joe", last_name: "Blow") }

    context "John" do
      subject { Candidate.search("John") }
      it { should == [candidate_john] }
    end

    context "name starts with Jo" do
      subject { Candidate.search("Jo") }
      it { should == [candidate_john, candidate_joe] }
    end

    context "first name is 'Dave' and last name is 'Happy'" do
      subject { Candidate.search("Dave Happy") }
      it { should == [candidate_dave] }
    end
  end

  describe ".sanitize_name" do
    subject { Candidate.sanitize_name(name) }

    context "with a first and last name" do
      let(:name) { "Dave Happy" }
      it { should == ["%Dave%", "%Happy%"] }
    end

    context "with a first or last name only" do
      let(:name) { "Dave" }
      it { should == ["%Dave%", "%Dave%"] }
    end
  end

  describe ".filter_by" do
    let(:hired_candidate) { Fabricate(:candidate, status: "hired") }
    let(:rejected_candidate) { Fabricate(:candidate, status: "rejected") }

    subject { Candidate.filter_by(:status, "hired") }

    context "with a status of hired" do
      it { should == [hired_candidate] } 
    end
  end

  describe "#full_name" do
    let(:candidate) { Fabricate(:candidate, first_name: "Mary", last_name: "Jane") }

    subject { candidate.full_name }

    it "is the candidate's first and last name" do
      subject.should == "Mary Jane"
    end
  end
end
