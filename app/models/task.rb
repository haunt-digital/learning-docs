class Task < ActiveRecord::Base
  has_many :external_resources, dependent: :destroy

end
