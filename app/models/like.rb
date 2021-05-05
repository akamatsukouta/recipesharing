class Like < ApplicationRecord
  belongs_to :cooking
  belongs_to :user
  validates_uniqueness_of :cooking_id, scope: :user_id
end
