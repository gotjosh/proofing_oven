require 'spec_helper'

describe ApplicationHelper do
  describe "#humanize_boolean" do
    context "when boolean is true" do
      subject { helper.humanize_boolean(true) }
      it {should == "Yes"}
    end
    context "when boolean is false" do
      subject { helper.humanize_boolean(false) }
      it {should == "No"}
    end
  end
end
