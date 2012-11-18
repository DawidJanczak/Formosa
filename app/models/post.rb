class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title, :body

  validates :title, presence: true
  validates :body, presence: true

  default_scope order: "created_at DESC"
end
