class LearningObject < ApplicationRecord
  validates_presence_of :title, :description
  validates_inclusion_of :available, in: [true, false]

  belongs_to :user
  has_many :exercises
end
