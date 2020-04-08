class Post < ApplicationRecord
  belongs_to :user

  has_attached_file :thumbnail, styles: { medium: "300x300>", 
    thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  has_attached_file :banner, styles: { medium: "300x300>", thumb: "100x100>" }, 
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :banner, content_type: /\Aimage\/.*\z/

  validates :title, presence: true, length: { minimum:  5 } 
  validates :body, presence: true, length: { minimum: 25 }
end
