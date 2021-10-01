class User < ApplicationRecord
  has_secure_password

  enum role: {admin: 0, fold: 1}
end
