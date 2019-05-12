require 'rails_helper'

RSpec.describe Visit, type: :model do
  it { is_expected.to be_mongoid_document }

  it { is_expected.to have_fields(:guid, :url).of_type(String) }

  it { is_expected.to have_field(:timestamp).of_type(Integer) }

  it { is_expected.to validate_presence_of(:guid) }

  it { is_expected.to validate_presence_of(:url) }

  it { is_expected.to validate_presence_of(:timestamp) }

  it { is_expected.to have_index_for(timestamp: -1) }

  it do
    is_expected
      .to have_index_for({ timestamp: -1, guid: 1 })
      .with_options(unique: true)
  end
end
