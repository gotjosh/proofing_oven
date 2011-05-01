class CandidatesController < ApplicationController
  expose(:candidates) do
    if params[:search]
      Candidate.search(params[:search][:value])
    else
      Candidate.scoped
    end
  end
  expose(:candidate)

  def create
    candidate.save
    respond_with :candidate, location: candidates_path
  end

  def search
    render :index
  end

end
