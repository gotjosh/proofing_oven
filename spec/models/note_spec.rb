require 'spec_helper'

describe Note do
  describe "#before_save" do
    subject { Fabricate(:note) }
    its(:added_on) { should == Date.today }
  end
end
