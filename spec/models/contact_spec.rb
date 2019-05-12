require 'rails_helper'

RSpec.describe Contact, type: :model do
  it { is_expected.to be_mongoid_document }

  it { is_expected.to have_timestamps }

  it { is_expected.to have_fields(:email, :name, :guid).of_type(String) }

  it { is_expected.to validate_presence_of(:email) }

  it { is_expected.to validate_presence_of(:name) }

  it { is_expected.to validate_uniqueness_of(:email) }

  it { is_expected.to have_index_for(email: 1).with_options(unique: true) }
end
