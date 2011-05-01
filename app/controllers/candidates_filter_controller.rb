class CandidatesFilterController < ApplicationController
  expose(:candidates) do
    if params[:filter][:status] == "display all"
      Candidate.scoped
    else
      Candidate.filter_by(:status, params[:filter][:status])
    end
  end

  def filter
    render "candidates/index"
  end
end
