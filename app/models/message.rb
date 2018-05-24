class Message < ApplicationRecord
  belongs_to :user
  belongs_to :forum
  default_scope -> { order(created_at: :desc) }
  validates :content, presence: true
  validates :name, presence: true
  validates :user_id, presence: true

  after_save{
    self.forum.update(updated_at: self.created_at)
  }
end
