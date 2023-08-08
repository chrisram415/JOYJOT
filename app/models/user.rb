class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :joys
  has_many :recommendations
  has_many :games
  has_many :gamecards, through: :games

  # validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :encrypted_password, presence: true
  # validates :reset_password_token, uniqueness: true, allow_blank: true
end
