require 'spec_helper'

describe Candidate do
  describe "#last_first" do
    let(:candidate) { Fabricate(:candidate, first_name: "John", last_name: "Doe") }
    subject { candidate.last_first }
    it "is the candidates full name" do
      subject.should == "Doe, John"
    end
  end
end
