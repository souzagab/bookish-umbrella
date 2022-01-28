class Course < ApplicationRecord
  has_paper_trail

  has_many :enrollments
  has_many :attendees, through: :enrollments, source: :user
  has_many :contents

  has_one_attached :thumbnail

  validates :title, presence: true
  validates :description, presence: true
end
