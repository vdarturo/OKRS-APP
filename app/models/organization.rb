class Organization < ApplicationRecord
  has_many :users
  has_many :objectives
  has_many :owners
end
