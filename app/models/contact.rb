# frozen_string_literal: true

class Contact
  include Mongoid::Document
  include Mongoid::Timestamps
  field :email, type: String
  field :name, type: String

  validates_presence_of :email, :name
  validates_uniqueness_of :email

  index({ email: 1 }, { unique: true })
end
