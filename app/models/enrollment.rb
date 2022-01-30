class Enrollment < ApplicationRecord
  has_paper_trail

  belongs_to :course
  belongs_to :user

  validates :user_id, uniqueness: { scope: :course_id }
end
