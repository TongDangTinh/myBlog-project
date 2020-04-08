class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  has_attached_file :banner, styles: { medium: "300x100>", thumb: "100x100>" }, 
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :banner, content_type: /\Aimage\/.*\z/

  validates :title, presence: true, length: { minimum:  5 } 
  validates :body, presence: true, length: { minimum: 25 }

  self.per_page = 10

  extend FriendlyId
  friendly_id :title, use: :slugged
end
