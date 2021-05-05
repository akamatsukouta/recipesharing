class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :cooking

  validates :text, presence: true
  validates :user, presence: true
  validates :cooking, presence: true
end
