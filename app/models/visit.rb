# frozen_string_literal: true

class Visit
  include Mongoid::Document
  field :guid, type: String
  field :timestamp, type: Integer
  field :url, type: String

  validates_presence_of :guid, :timestamp, :url

  index({ timestamp: -1 })
  index({ timestamp: -1, guid: 1 }, { unique: true })
end
