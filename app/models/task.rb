class Task < ApplicationRecord
  belongs_to :category, foreign_key: "category_id"
  belongs_to :user

  # validates :title, :details, :category, presence: true
  # validates :title, uniqueness: true
  # validates :due_date, :due_date_cannot_be_in_the_past, allow_blank: true

  # def due_date_cannot_be_in_the_past
  #   if due.present? && due < Date.today
  #   errors.add(:due, "can't be in the past")
  #   end
  # end
end
