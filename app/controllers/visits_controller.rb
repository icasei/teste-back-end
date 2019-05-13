# frozen_string_literal: true

class VisitsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  REPORT_LIMIT = 50

  def create
    visit = Visit.new(visit_params)
    VisitsPersistJob
      .perform_later(visit.serializable_hash(except: :_id))

    head :accepted
  rescue ActionController::ParameterMissing
    head :bad_request
  end

  def report
    @visits = Visit
              .order(timestamp: :desc)
              .limit(params[:limit].to_i || REPORT_LIMIT)
  end

  private

  def visit_params
    params.require(:visit).permit(:guid, :timestamp, :url)
  end
end
