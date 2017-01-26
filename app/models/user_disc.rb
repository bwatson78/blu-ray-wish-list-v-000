class UserDisc < ApplicationRecord
  belongs_to :user
  belongs_to :disc
end
