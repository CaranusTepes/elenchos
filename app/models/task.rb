class Task < ApplicationRecord
  belongs_to :category, foreign_key: "category_id"
  belongs_to :user

  validates :title, :details, :category, presence: true
  validates :title, uniqueness: true

end
