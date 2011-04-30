class CandidatesController < AuthenticatedController
  expose(:candidates) { current_user.candidates.asc(:last_name, :first_name) }
  expose(:candidate)
end
