class Objective < ApplicationRecord
  belongs_to :organization
  belongs_to :owner
  has_many :key_results
end
