class Employee < ActiveRecord::Base

	has_attached_file :image, :presence => true, styles: { medium: "300x300>", thumb: "40x40>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: ['image/png', 'image/gif' ]

  # /\Aimage\/.*\Z/
  has_attached_file :image, :presence => true
    # has_attached_file :image, :size => { :in => 0..100.kilobytes }
     has_attached_file :image, :less_than => 2.megabytes

   validates :name, presence: true
    validates :phone, presence: true, uniqueness: true
   validates :email, presence: true, uniqueness: true
   # validates :email, uniqueness: true
   validates :phone,  length: { is: 10 },  numericality: { only_integer: true }

   
end
