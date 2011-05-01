require 'spec_helper'

describe Candidate do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }

  describe '#full_name' do
    let(:candidate) do
      Fabricate.build(:candidate, :first_name => first_name, :last_name => last_name)
    end
    subject { candidate.full_name }

    context 'when #first_name is "Lar"' do
      let(:first_name) { 'Lar' }

      context 'and #last_name is "Van Der Jagt"' do
        let(:last_name) { 'Van Der Jagt' }

        it { should == 'Lar Van Der Jagt' }
      end
      context 'and #last_name is "Van"' do
        let(:last_name) { 'Van' }

        it { should == 'Lar Van' }
      end
    end
    context 'when #first_name is "Alex"' do
      let(:first_name) { 'Alex' }
      context 'and last name is "A"' do
        let(:last_name) { 'A' }

        it { should == 'Alex A' }
      end
    end
  end

  describe "#skills=" do
    let(:candidate) do
      Fabricate.build(:candidate, skills: skills)
    end
    subject { candidate.skills }

    context 'when passed empty strings' do
      let(:skills) { ["", "BDD", "", "Rails"] }

      it { should == ["BDD", "Rails"] }
    end
  end

  describe "#skills" do
    let(:candidate) { Fabricate.build(:candidate) }
    context 'when nil' do
      its(:skills) { should == [] }
    end
  end

end
