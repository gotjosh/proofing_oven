require 'spec_helper'

describe Candidate do
  describe "#name" do
    subject { Candidate.new(first_name: "Paul", last_name: "Elliott") }
    its(:name) { should == "Paul Elliott" }
  end
end
