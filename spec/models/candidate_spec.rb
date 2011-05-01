require 'spec_helper'

describe Candidate do

  it { should have_many(:notes).dependent(:destroy) }

  describe ".filterable_attributes" do
    it "returns the filterable attributes" do
      Candidate.send(:filterable_attributes).should == [:status, :willing_to_relocate]
    end
  end

  describe ".applicable_filter_params" do
    subject { Candidate.send(:applicable_filter_params, params) }

    context "when params have values" do
      let(:params) { {status: 'hired', willing_to_relocate: 'true'} }

      it { should == {status: 'hired', willing_to_relocate: 'true'} }
    end

    context "when extra params are present" do
      let(:params) { {status: 'hired', action: 'new', controller: 'hotdogs'} }

      it { should == {status: 'hired'} }
    end

    context "when params have nil values" do
      let(:params) { {status: nil, willing_to_relocate: 'true'} }

      it { should == {willing_to_relocate: 'true'} }
    end
  end

  describe ".filter_by" do
    let!(:candidate) { Fabricate(:candidate, status: 'hired', willing_to_relocate: true) }
    let!(:candidate2) { Fabricate(:candidate, status: 'fired', willing_to_relocate: false) }
    let!(:candidate3) { Fabricate(:candidate, status: 'hired', willing_to_relocate: false) }
    let!(:candidate4) { Fabricate(:candidate, status: 'rejected', willing_to_relocate: true) }
    subject { Candidate.filter_by(status: 'hired', willing_to_relocate: 'true') }

    it { should == [candidate] }
  end

  describe ".filter_by_status" do
    let!(:candidate) { Fabricate(:candidate, status: 'hired') }
    let!(:candidate2) { Fabricate(:candidate, status: 'fired') }
    subject { Candidate.filter_by_status('hired') }

    it { should == [candidate] }
  end

  describe ".filter_by_willing_to_relocate" do
    let!(:candidate) { Fabricate(:candidate, willing_to_relocate: true) }
    let!(:candidate2) { Fabricate(:candidate, willing_to_relocate: false) }
    subject { Candidate.filter_by_willing_to_relocate('true') }

    it { should == [candidate] }
  end

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
