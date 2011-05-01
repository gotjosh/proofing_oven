require 'spec_helper'

describe Api::CandidatesController do
  let(:user) { Fabricate(:user) }

  context "GET show" do
    let(:candidate) do
      Fabricate(
        :candidate,
        user: user,
        first_name: "James",
        last_name: "Brolin",
        email: "james@brolin.com",
        phone: "5555555555",
        github: "jbrolin",
        twitter: "jb",
        local: true,
        willing_to_relocate: false,
        added_on: "2011-04-01".to_date,
        status: "Accepted"
      )
    end
    let(:json) { JSON.parse(response.body) }
    subject { response }

    context "success" do
      before { get :show, id: candidate.id, authentication_token: user.authentication_token }

      it { should be_successful }
      its(:status) { should == 200 }

      it 'returns the candidate as json' do
        json.should == {
          '_id' => candidate.id.to_s,
          'first_name' => "James",
          'last_name' => "Brolin",
          'email' => "james@brolin.com",
          'phone' => "5555555555",
          'github' => "jbrolin",
          'twitter' => "jb",
          'local' => true,
          'willing_to_relocate' => false,
          'added_on' => "2011-04-01T00:00:00Z",
          'status' => "Accepted"
        }
      end
    end

    context "not found" do
      before { get :show, id: "NOT-FOUND", authentication_token: user.authentication_token }
      it { should_not be_successful }
      its(:status) { should == 404 }
    end

    context "not authorized" do
      before { get :show, id: candidate.id, authentication_token: "sfdhjl213" }
      it { should_not be_successful }
      its(:status) { should == 401 }
    end
  end

  context "GET index" do
    let!(:candidates) do
      (1..5).map { Fabricate(:candidate, user: user) }
    end
    let(:candidate_ids) { candidates.map { |c| c._id.to_s } }
    let(:json) { JSON.parse(response.body) }
    subject { response }

    context "success" do
      before { get :index, authentication_token: user.authentication_token }

      it { should be_successful }
      its(:status) { should == 200 }

      it 'returns the candidate as json' do
        json.map { |o| o["_id"] }.should =~ candidate_ids
      end
    end

    context "not authorized" do
      before { get :index, authentication_token: "sfdhjl213" }
      it { should_not be_successful }
      its(:status) { should == 401 }
    end

  end
end
