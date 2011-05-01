class CandidatesController < ApplicationController
  expose(:candidates) { Candidate.all }
  expose(:candidate)

  respond_to :html

  def create
    candidate.save
    respond_with candidate
  end
  alias update create

  def destroy
    candidate.destroy
    respond_with candidate
  end

  private

  def interpolation_options
    { downcased_resource_name: 'candidate' }
  end
end
