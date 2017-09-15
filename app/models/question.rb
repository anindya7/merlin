class Question < ApplicationRecord
  belongs_to :quiz
  belongs_to :option_set
end
