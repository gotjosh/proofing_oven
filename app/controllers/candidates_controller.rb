class CandidatesController < ApplicationController
  expose(:candidates) { Candidate.all }
  expose(:candidate)

  respond_to :html

  def create
    if candidate.save
      redirect_to candidates_path, notice: "Candidate created successfully"
    end
  end

  def update
    candidate.save
    respond_with candidate, location: candidates_url
  end

end
