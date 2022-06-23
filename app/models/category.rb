class Category < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
  has_many :tasks

  validates :title, :details, :user, presence: true
  validates :title, uniqueness: true
end
