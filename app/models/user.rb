class User < ApplicationRecord
    has_many :posts
    has_secure_password
    validates :email, presence: true, format: { with: /([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})/ }

    def is_my_post?(post)
        posts.include?(post)
    end
end
