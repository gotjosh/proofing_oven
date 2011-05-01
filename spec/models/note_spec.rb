require 'spec_helper'

describe Note do
  it { should belong_to(:candidate) }
  it { should have_many(:tags).dependent(:destroy) }
end
