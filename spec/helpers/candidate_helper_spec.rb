require 'spec_helper'

describe CandidateHelper do
  
  describe 'boolean_transformer' do
    context "true value" do
      it "should return 'Yes'" do
         helper.boolean_transformer(true).should == "Yes"
      end
    end
    context "false value" do 
      it "should return 'No'" do
        helper.boolean_transformer(false).should == "No"
      end
    end
  end
  
  
end