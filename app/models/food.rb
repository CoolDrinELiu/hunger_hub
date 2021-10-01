class Food < ApplicationRecord
  mount_uploader :logo, LogoUploader

  validates :name, :logo, :desc, presence: true
end
