class CandidatesController < ApplicationController
  expose(:candidates) { Candidate.all }
  expose(:candidate)

  respond_to :html

  def create
    if candidate.save
      flash[:notice] = 'Candidate created successfully'
    else
      flash[:notice] = 'There was a problem saving your candidate'
    end
    respond_with candidate, location: candidates_url
  end

  def update
    candidate.save
    respond_with candidate, location: candidates_url
  end

end
