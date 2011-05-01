class CandidatesController < AuthenticatedController
  expose(:candidates) { current_user.candidates.asc(:last_name, :first_name) }
  expose(:note) { candidate.notes.build }

  def create
    respond_with(candidate.tap(&:save))
  end
  alias update create
end
