class Referral < ApplicationRecord
  validates_presence_of :refer_email, :refer_name, :email, :name
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_format_of :refer_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_length_of :refer_name, :minimum => 3, :maximum => 30
  validates_length_of :name, :minimum => 3, :maximum => 30
end
