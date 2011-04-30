class CandidatesController < ApplicationController
  expose(:candidates) { Candidate.all }
  expose(:candidate)

  respond_to :html

  def create
    candidate.save
    respond_with candidate
  end
  alias update create

  private

  def interpolation_options
    { downcased_resource_name: 'candidate' }
  end
end
