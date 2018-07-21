class Group < ApplicationRecord
  belongs_to :user
  has_many :joins, dependent: :destroy
  has_many :join_users,through: :joins,source: :user


  validates :name ,presence:true
  validates :place ,presence:true ,length: { maximum: 30 }
  validates :time ,presence:true ,length: { maximum: 30 }
  validates :content ,presence:true ,length: { maximum: 500 }
end
