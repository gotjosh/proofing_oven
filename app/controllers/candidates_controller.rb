class CandidatesController < ApplicationController
  expose(:candidates) { Candidate.scoped }
  expose(:candidate)
  expose(:filtered_candidates) { params[:status].present? ? candidates.where(status: params[:status]) : candidates }

  respond_to :html

  def update
    respond_with candidate.tap(&:save)
  end
end
