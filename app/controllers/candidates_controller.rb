class CandidatesController < ApplicationController
  expose(:candidates) { Candidate.all }
  expose(:candidate)
  expose(:skills) { Skill.all }

  respond_to :html

  def edit; end

  def create
    candidate.save
    respond_with candidate
  end
  alias update create

  def destroy
    candidate.destroy
    respond_with candidate
  end

  def accept
    flash[:notice] = "#{candidate.email} got the job"
    CandidateMailer.accept(candidate).deliver
    redirect_to candidates_path
  end

  private

  def interpolation_options
    { downcased_resource_name: 'candidate' }
  end
end
