class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true
  validates :profile, length: { maximum: 200 }

  mount_uploader :image, ImageUploader
  
  has_many :videos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_videos, through: :likes, source: :video
  has_many :photos, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_photos, through: :favorites, source: :photo
  has_many :reviews, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :captures, dependent: :destroy
  has_many :captured_events, through: :captures, source: :event
  has_many :opinions, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  def already_captured?(event)
          self.captures.exists?(event_id: event.id)
  end

  def already_liked?(video)
          self.likes.exists?(video_id: video.id)
  end

  def already_favorited?(photo)
          self.favorites.exists?(photo_id: photo.id)
  end
end