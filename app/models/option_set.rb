class OptionSet < ApplicationRecord
  has_and_belongs_to_many :options

  validates_presence_of :name, :noop
  validates_uniqueness_of :name
end
