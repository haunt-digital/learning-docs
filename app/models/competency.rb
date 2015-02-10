class Competency < ActiveRecord::Base
  has_and_belongs_to_many :skills

  validates :title, length: { maximum: 128 }
end
