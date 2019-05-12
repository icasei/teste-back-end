# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VisitsPersistJob, type: :job do
  describe '#perform' do
    before { Visit.create_indexes }

    context 'first time that receive some job' do
      it 'persists the Visit on db' do
        visit = {
          guid: '0d7c2c5b-55d2-482e-a00c-516bfe2e8f75',
          url: 'somecoolsite.io/path',
          timestamp: Time.now.to_i
        }

        VisitsPersistJob.perform_now(visit)

        expect(Visit.where(visit).count).to eq 1
      end
    end

    context 'receive the same job again' do
      it 'do not duplicate the Visit on db' do
        visit = {
          guid: '0d7c2c5b-55d2-482e-a00c-516bfe2e8f75',
          url: 'somecoolsite.io/path',
          timestamp: Time.now.to_i
        }

        VisitsPersistJob.perform_now(visit)
        # do it again will raise Mongo::Error::OperationFailure
        # due to unique index at guid + timestamp
        VisitsPersistJob.perform_now(visit)

        expect(Visit.where(visit).count).to eq 1
      end
    end
  end
end
