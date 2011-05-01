class CandidatesController < AuthenticatedController
  expose(:all_candidates) { current_user.candidates }
  expose(:candidates) { current_user.candidates.asc(:last_name, :first_name) }
  expose(:candidate)

  def create
    respond_with(candidate.tap(&:save))
  end
  alias update create
end
