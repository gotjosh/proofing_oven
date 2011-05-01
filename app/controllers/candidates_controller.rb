class CandidatesController < ApplicationController
  expose(:candidates) { Candidate.scoped }
  expose(:candidate)
  expose(:filtered_candidates) { candidates.filter_by(params) }
  respond_to :html

  def update
    respond_with candidate.tap(&:save)
  end
end
