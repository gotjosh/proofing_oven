class CandidatesController < ApplicationController
  expose(:candidates) { Candidate.scoped }
  expose(:candidate)
  expose(:note) { candidate.notes.build }

  def create
    candidate.save
    respond_with candidate
  end
  alias :update :create
end
