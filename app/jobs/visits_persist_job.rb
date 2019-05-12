# frozen_string_literal: true

class VisitsPersistJob < ApplicationJob
  queue_as :default

  discard_on Mongo::Error::OperationFailure

  def perform(visit)
    Visit.create!(visit)
  end
end
