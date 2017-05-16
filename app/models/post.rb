class Post < ActiveRecord::Base
  # Every post can have a User ID associated with it
  belongs_to :user
  # "validates" will make sure userid is present --> You cant have a post without an ID
  validates :user_id, presence: true
  # This will make sure that there is something written in the post and that it is of length <=140 characters --> ERROR if > 140
  validates :content, presence: true, length: { maximum: 140 }
  # Newest tweets / posts first --> sorts by date of post created
  default_scope -> { order(created_at: :desc) }
end