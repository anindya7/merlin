class Question < ApplicationRecord
  belongs_to :quiz
  belongs_to :option_set

  validates_presence_of :question, :option_set_id, :quiz_id
  validates_uniqueness_of :question, scope: [:option_set_id, :quiz_id]
end
