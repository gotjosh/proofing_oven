require 'spec_helper'

describe Candidate do
  
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }
  
  describe "#name" do
    subject { Fabricate(:candidate, first_name: "Ann", last_name: "O'Malley" ) }
    
    its(:name) { should == "Ann O'Malley" }
  end
end
