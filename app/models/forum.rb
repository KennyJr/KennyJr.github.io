class Forum < ApplicationRecord
  belongs_to :user
  has_many :messages
  validates :user_id, presence: true
  validates :name, presence: true
  validates :title, presence: true, uniqueness: true

end
