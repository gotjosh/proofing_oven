class CandidatesController < AuthenticatedController
  expose(:candidates) { current_user.candidates.asc(:last_name, :first_name) }

  def create
    respond_with(candidate.tap(&:save))
  end
  alias update create
end
