require 'spec_helper'

describe Candidate do
  
  describe "#name" do
    subject { Fabricate(:candidate, first_name: "Ann", last_name: "O'Malley" ) }
    
    its(:name) { should == "Ann O'Malley" }
  end
end
