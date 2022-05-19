class Post < ApplicationRecord
    belongs_to :user
    validates :title, presence: true
    validates :content, presence: true
    after_create_commit { broadcast_prepend_to :all_posts }
    after_destroy_commit { broadcast_remove_to :all_posts }
    after_update_commit { broadcast_replace_to :all_posts }
end
