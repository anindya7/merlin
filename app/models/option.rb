class Option < ApplicationRecord
  has_and_belongs_to_many :option_sets
  validates_presence_of :text, :value
  validates_uniqueness_of :text, scope: [:value]
end
