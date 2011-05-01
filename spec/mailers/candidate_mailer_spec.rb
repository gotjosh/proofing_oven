require 'spec_helper'

describe CandidateMailer do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  describe '#accept' do
    let(:candidate) do
      stub(email: 'lar@loosecubes.com')
    end
    subject { CandidateMailer.accept(candidate) }

    it { should deliver_to('lar@loosecubes.com') }
    it { should deliver_from('hu@hashrocket.com') }
    it { should have_subject(/You got the job/) }
    it { should have_body_text(/Congratulations/) }
  end

end
