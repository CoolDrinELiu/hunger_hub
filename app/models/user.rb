class User < ApplicationRecord
  has_secure_password

  enum role: {admin: 0, folk: 1}

  has_many :subscriptions
end
