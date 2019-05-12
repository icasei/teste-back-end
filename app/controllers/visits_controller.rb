# frozen_string_literal: true

class VisitsController < ApplicationController
  def create
    visit = Visit.new(visit_params)
    VisitsPersistJob
      .perform_later(visit.serializable_hash(except: :_id))

    head :accepted
  rescue ActionController::ParameterMissing
    head :bad_request
  end

  private

  def visit_params
    params.require(:visit).permit(:guid, :timestamp, :url)
  end
end
