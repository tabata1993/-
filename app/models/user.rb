class User < ApplicationRecord
  has_many :groups
  has_many :joins, dependent: :destroy
  has_many :join_groups,through: :joins,source: :group
  has_many :boards, dependent: :destroy
  has_many :board_groups,through: :joins,source: :group
  validates :name, presence: true, length: { maximum: 10 }
  validates :email, presence: true,uniqueness: true,length: { maximum: 255},format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_save { email.downcase! }
  has_secure_password
  validates :password, presence: true, on: :create, length: { minimum: 6 }
end
