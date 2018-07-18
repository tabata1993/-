class Group < ApplicationRecord
  validates :name ,presence:true
  validates :place ,presence:true ,length: { maximum: 30 }
  validates :time ,presence:true ,length: { maximum: 30 }
  validates :content ,presence:true ,length: { maximum: 500 }
end
