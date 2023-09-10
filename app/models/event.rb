class Event < ApplicationRecord
    belongs_to :user
    has_many :captures, dependent: :destroy
    has_many :captured_users, through: :captures, source: :user
    has_many :opinions, dependent: :destroy
end