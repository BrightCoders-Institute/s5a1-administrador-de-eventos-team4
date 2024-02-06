class Event < ApplicationRecord
  belongs_to :user

  scope :user_event, ->(user) { where(user_id: user.id) }
end
