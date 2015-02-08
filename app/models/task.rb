class Task < ActiveRecord::Base
  has_many :external_resources, dependent: :destroy

  validates :title, length: { maximum: 128 }

  markable_as :complete

  include RendersMarkdown

  renders_markdown :description
end
