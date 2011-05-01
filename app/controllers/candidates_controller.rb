class CandidatesController < ApplicationController
  expose(:candidates) { Candidate.scoped }
  expose(:candidate)

  def create
    candidate.save
    respond_with :candidate, location: candidates_path
  end

end
