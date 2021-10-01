class Food < ApplicationRecord
  mount_uploader :logo, LogoUploader

  validates :name, :logo, :desc, :end_at, presence: true

  scope :valid, -> {where("end_at > ?", Time.now)}
end
