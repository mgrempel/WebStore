class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :address_infos
  has_many :billing_infos

  validates :username, :password_digest, presence: true
  validates :username, length: { maximum: 30, minimum: 5 }
  validates :password_digest, length: { maximum: 1000, minimum: 8 }
  validates :account_prefs, length: { maximum: 1000 }
end
