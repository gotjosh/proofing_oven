require 'spec_helper'

describe User do
  describe "#full_name" do
    let(:user) { Fabricate(:user, first_name: "Bob", last_name: "Smith") }
    subject { user.full_name }

    it "is the user's first and last name" do
      subject.should == "Bob Smith"
    end
  end
end
