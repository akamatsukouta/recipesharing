class Cooking < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many_attached :images

  validates :cooking_name, presence: true
  validates :recipe,       presence: true
  validates :material,     presence: true
  validates :production_time, presence: true
  validate :image_length

  def self.search(search)
    if search != ""
      Cooking.where('cooking_name LIKE(?)', "%#{search}%")
    else
      Cooking.all
    end
  end   

  private

  def image_length
    if images.length >= 5
      errors.add(:images, "4枚以内にしてください")
    end
  end
end
