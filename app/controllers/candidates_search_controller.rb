class CandidatesSearchController < ApplicationController
  expose(:candidates) { Candidate.search(params[:search][:value]) if params[:search] }

  def search
    render "candidates/index"
  end
end
