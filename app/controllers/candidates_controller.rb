class CandidatesController < ApplicationController
  before_filter :authenticate_user!
end
