class Post < ApplicationRecord
  belongs_to :user
  # ***** 以下を追加 *****
  validates :content, presence: true
  # ***** 以上を追加 *****
end
