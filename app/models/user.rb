class User < ApplicationRecord
  has_many :categories
  has_many :tasks

  # validates :email, :email_confirmation, :password, presence: true
  # validates :email, confirmation: true
  # validates :email_confirmation, presence: true
  # validates :email, confirmation: { case_sensitive: true }
  # validates :password, length: { minimum: 6 }
  # validates :email, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
end
