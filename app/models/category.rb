class Category < ApplicationRecord
  belongs_to :user
  has_many :tasks

  # validates :title, :details, :user, presence: true
  # validates :title, uniqueness: true
end
