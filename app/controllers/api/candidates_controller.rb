class Api::CandidatesController < ApplicationController
  expose(:current_user) { User.where(authentication_token: params[:authentication_token]).one }
  expose(:candidates) { current_user.candidates }
  expose(:candidate) { candidates.where(_id: params[:id]).one }

  before_filter :authentication_required

  def index
    render json: candidates
  end

  def show
    if candidate
      render json: candidate.to_json
    else
      render nothing: true, status: :not_found
    end
  end

  protected

  def authentication_required
    render nothing: true, status: :unauthorized unless current_user
  end
end
