class DiscMovie < ApplicationRecord
  belongs_to :disc
  belongs_to :movie
end
