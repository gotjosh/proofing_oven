require 'spec_helper'

describe Candidate do
  describe "#name" do
    subject { Candidate.new(first_name: "Paul", last_name: "Elliott") }
    its(:name) { should == "Paul Elliott" }
  end

  describe "#before_save" do
    subject { Fabricate(:candidate) }
    its(:added_on) { should == Date.today }
  end
end
