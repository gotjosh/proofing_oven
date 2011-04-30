class CandidatesController < ApplicationController
  expose(:candidates) { Candidate.all }
  expose(:candidate)

  def create
    if candidate.save
      redirect_to candidates_path, notice: "Candidate created successfully"
    end
  end

end
