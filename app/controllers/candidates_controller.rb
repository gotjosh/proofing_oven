class CandidatesController < ApplicationController
  expose(:candidates) { Candidate.scoped }
  expose(:candidate)
  expose(:errors) { candidate.errors.full_messages }
  
  def create
    if candidate.save
      redirect_to candidate, :notice => "Successfully added candidate"
    else
      render :new
    end
  end
  
  
end
