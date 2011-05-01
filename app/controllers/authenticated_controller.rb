class AuthenticatedController < ApplicationController
  before_filter :authenticate_user!

  expose(:all_candidates) { current_user.candidates }
  expose(:candidate)
end
