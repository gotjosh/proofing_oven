class CandidatesController < ApplicationController
  expose(:candidates) { Candidate.scoped }
  expose(:candidate)

  respond_to :html

  def update
    respond_with candidate.tap(&:save)
  end
end
